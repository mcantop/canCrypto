//
//  HomeView.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                TopMoversView()
                
                Divider().padding(.vertical, 6)
                
                AllCoinsView()
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
