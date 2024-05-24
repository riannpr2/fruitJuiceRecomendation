//
//  splashScreenPage.swift
//  fruitJuiceRecomendation
//
//  Created by Henrian Pranata on 21/05/24.
//

import SwiftUI

struct splashScreenPage: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView(classifier: ImageClassifier())
        } else {
            VStack {
                Image("juicejoy_logo")
                    .resizable()  // Mengatur gambar agar dapat diubah ukurannya
                    .aspectRatio(contentMode: .fit)  // Mengatur aspect ratio gambar
                    .frame(width: 600, height: 600)  // Mengatur ukuran gambar
                    .padding(.leading, -70)
                    .padding(.top, -80)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeInOut(duration: 1.2)){
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    splashScreenPage()
}
