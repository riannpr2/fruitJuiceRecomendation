//
//  fruitJuiceRecomendationApp.swift
//  fruitJuiceRecomendation
//
//  Created by Henrian Pranata on 21/05/24.
//

import SwiftUI

@main
struct fruitJuiceRecomendationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(classifier: ImageClassifier())
        }
    }
}
