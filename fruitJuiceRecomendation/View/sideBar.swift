//
//  sideBar.swift
//  fruitJuiceRecomendation
//
//  Created by Henrian Pranata on 25/05/24.
//

import SwiftUI
//TODO: dipake kah di app?
struct sideBar: View {
    
    var body: some View {
         NavigationView {
            List(0..<10){ item in
                Text("item name")
            }
            .navigationTitle("Content list")
            
            Text("Detail")
            Text("Content")
        }
    }
}


#Preview {
    sideBar()
}
