//
//  splashScreenPage.swift
//  fruitJuiceRecomendation
//
//  Created by Henrian Pranata on 21/05/24.
//

import SwiftUI

struct splashScreenPage: View {
    var body: some View {
        VStack {
            Image("juicejoy_logo")
                .resizable()  // Mengatur gambar agar dapat diubah ukurannya
                .aspectRatio(contentMode: .fit)  // Mengatur aspect ratio gambar
                .frame(width: 600, height: 600)  // Mengatur ukuran gambar
                .padding(.leading, -70)
                .padding(.top, -80)
            
        }
    }
}

#Preview {
    splashScreenPage()
}
