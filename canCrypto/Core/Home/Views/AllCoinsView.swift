//
//  AllCoinsView.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI

struct AllCoinsView: View {
    // MARK: - Properties
    @StateObject var homeViewModel: HomeViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // MARK: - Header
            SectionHeaderTitle("All Coins")
            
            VStack(spacing: 6) {
                // MARK: - Coin & Prices
//                HStack(spacing: 0) {
//                    Text("Coin")
//                    
//                    Spacer()
//                    
//                    Text("Prices")
//                }
//                .font(.caption)
//                .foregroundColor(.gray)
//                .padding(.horizontal)
                
                // MARK: - List
                ScrollView(showsIndicators: false) {
                    ForEach(homeViewModel.coins) { coin in
                        NavigationLink {
                            LazyNavigation(CoinDetailsView(coin: coin))
                        } label: {
                            CoinRowView(coin: coin)
                        }
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView(homeViewModel: HomeViewModel())
    }
}
