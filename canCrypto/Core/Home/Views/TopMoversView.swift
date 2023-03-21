//
//  TopMoversView.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI

struct TopMoversView: View {
    // MARK: - Properties
    @StateObject var homeViewModel: HomeViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // MARK: - Header
            SectionHeaderTitle("Top Movers")
            
            // MARK: - List
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(homeViewModel.topMovingCoins) { coin in
                        NavigationLink {
                            CoinDetailsView()
                        } label: {
                            TopMoversItemView(coin: coin)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(homeViewModel: HomeViewModel())
    }
}
