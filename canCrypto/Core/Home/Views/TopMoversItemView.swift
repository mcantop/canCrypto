//
//  TopMoversItemView.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    // MARK: - Properties
    @Environment(\.colorScheme) var scheme
    let coin: CoinModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // MARK: - Image
            KFImage(coin.image)
                .resizable()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            
            Spacer().frame(height: 4)
            
            // MARK: - Coin Info
            HStack(spacing: 4) {
                Text(coin.symbol.uppercased())
                    .fontWeight(.bold)
                
                Text(coin.currentPrice.toCurrency())
                    .foregroundColor(.gray)
            }
            .font(.caption)
            
            // MARK: - Coin Percent Change
            Text(coin.priceChangePercentage24h.toPercent())
                .font(.title2)
                .foregroundColor(coin.percentageColor)
        }
        .tint(.primary)
        .cornerRadius(10)
        .frame(width: 150, height: 150)
        .background(
            Color(.systemGray6)
                .cornerRadius(15)
                .shadow(color: scheme == .light ? .gray.opacity(0.25) : .clear, radius: 5, x: 5, y: 5)
        )
        .padding(.top, 8)
        .padding(.bottom)
    }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}
