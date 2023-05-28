//
//  ContentView.swift
//  Superhero App
//
//  Created by Engy on 08/05/2023.
//

import SwiftUI

struct ContentView: View {
    var superHeros:[Superhero]=superherosData
    var body: some View {
        ScrollView(.horizontal){
            
           HStack {
               ForEach(superHeros) { item in
                   SuperheroView(superH: item)
               }
               .padding(20)
            }
           
            
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
