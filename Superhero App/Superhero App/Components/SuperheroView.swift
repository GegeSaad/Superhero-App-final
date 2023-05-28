//
//  SuperheroView.swift
//  Superhero App
//
//  Created by Engy on 08/05/2023.
//

import SwiftUI

struct SuperheroView: View {
    @State var isScaling:Bool=false
    @State var isSliding:Bool = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    var superH: Superhero
    @State var isAlertPresented:Bool = false
    var body: some View {
        ZStack{
            Image(superH.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScaling ? 1 : 0.7)
                .animation(.easeOut(duration: 0.8), value: isScaling)
            VStack{
                Text(superH.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                Button {
                    //some action
                    isAlertPresented.toggle()
                    hapticImpact.impactOccurred()
                    playSound(sound: "chimeup", type: "mp3")
                } label: {
                    HStack {
                        Text(superH.title)
                        Image(systemName:"arrow.right.circle")
                    } //:HStack
                    .padding(10)
                    .font(.title2)
                    .foregroundColor(.white)
                    
                    .background(LinearGradient(colors: superH.gradientColors, startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    .alert(isPresented: $isAlertPresented){
                        Alert(title: Text("More about \(superH.title)"),message: Text("\(superH.message)"),dismissButton: .default(Text("ok")))
                    }
                }

                
            }//:VStack
            .offset(y: isSliding ? 150 :300)
            .animation(.easeOut(duration: 3), value: isSliding)
        }//:zstack
        
        .frame(width: 365,height: 560,alignment: .center)
        .background(LinearGradient(colors: superH.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
        
        .cornerRadius(16)
        .shadow(color: .black, radius: 2,x: 2,y: 2)
        .onAppear{
            isScaling=true
            isSliding=true
        }
    }
}

struct SuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroView(superH:superherosData[2])
    }
}
