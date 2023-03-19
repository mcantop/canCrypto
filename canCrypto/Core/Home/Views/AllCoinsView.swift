//
//  AllCoinsView.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI

struct AllCoinsView: View {
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
                    ForEach(0..<50) { _ in
                        CoinRowView()
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
    }
}
