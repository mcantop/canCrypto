//
//  TopMoversView.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // MARK: - Header
            SectionHeaderTitle("Top Movers")
            
            // MARK: - List
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<5) { _ in
                        TopMoversItemView()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView()
    }
}
