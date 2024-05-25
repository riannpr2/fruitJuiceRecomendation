//
//  TwoColumnMasterView.swift
//  fruitJuiceRecomendation
//
//  Created by Henrian Pranata on 25/05/24.
//

import SwiftUI

struct TwoColumnMasterView: View {
    var body: some View {
        NavigationSplitView{
            List(0..<10){ item in
                Text("halo")
            }
        } detail: {
            Text("Detail View")
        }
    }
}

#Preview {
    TwoColumnMasterView()
}
