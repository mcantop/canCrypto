//
//  CoinRowView.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI

struct CoinRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            // MARK: - Market Cap Rank
            Text("1")
                .font(.caption)
                .foregroundColor(.gray)
            
            // MARK: - Image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            // MARK: - Coin Name Info
            VStack(alignment: .leading, spacing: 0) {
                Text("Bitcoin")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("BTC")
                    .font(.caption)
                    .padding(.leading, 2)
            }
            
            Spacer()
            
            // MARK: - Coin Price Info
            VStack(alignment: .trailing, spacing: 0) {
                Text("$20,330.00")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("-5.60%")
                    .font(.caption)
                    .padding(.trailing, 2)
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 12)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView()
    }
}
