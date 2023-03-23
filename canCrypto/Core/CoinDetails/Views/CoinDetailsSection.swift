//
//  CoinDetailsSection.swift
//  canCrypto
//
//  Created by Maciej on 22/03/2023.
//

import SwiftUI

struct CoinDetailsSection: View {
    // MARK: - Properties
    let model: CoinDetailsSectionModel
    private let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    // MARK: Body
    var body: some View {
        VStack {
            Text(model.title)
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 24) {
                ForEach(model.stats) { model in
                    StatisticView(model: model)
                }
            }
        }
    }
}

struct CoinDetailsSection_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsSection(model: dev.sectionModel)
    }
}
