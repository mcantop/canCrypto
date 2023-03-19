//
//  TopMoversItemView.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI

struct TopMoversItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // MARK: - Image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            Spacer().frame(height: 4)
            
            // MARK: - Coin Info
            HStack(spacing: 4) {
                Text("BTC")
                    .fontWeight(.bold)
                
                Text("$20,330.00")
                    .foregroundColor(.gray)
            }
            .font(.caption)
            
            // MARK: - Coin Percent Change
            Text("+ 5.60%")
                .font(.title2)
                .foregroundColor(.green)
        }
        .frame(width: 150, height: 150)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4), lineWidth: 1)
        )
    }
}

struct TopMoversItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversItemView()
    }
}
