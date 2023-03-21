//
//  CoinRowView.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    // MARK: - Properties
    @Environment(\.colorScheme) var scheme
    let coin: CoinModel
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 12) {
            // MARK: - Market Cap Rank
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            
            // MARK: - Image
            KFImage(coin.image)
                .resizable()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            
            // MARK: - Coin Name Info
            VStack(alignment: .leading, spacing: 0) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 2)
            }
            
            Spacer()
            
            // MARK: - Coin Price Info
            VStack(alignment: .trailing, spacing: 0) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(coin.priceChangePercentage24h.toPercent())
                    .font(.caption)
                    .foregroundColor(coin.percentageColor)
                    .padding(.trailing, 2)
            }
            
            Image(systemName: "chevron.right")
                .fontWeight(.semibold)
        }
        .tint(.primary)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(
            Color(.systemGray6)
                .shadow(color: scheme == .light ? .gray.opacity(0.25) : .clear, radius: 5, y: 5)
        )
        .padding(.bottom, 12)
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView()
//    }
//}
