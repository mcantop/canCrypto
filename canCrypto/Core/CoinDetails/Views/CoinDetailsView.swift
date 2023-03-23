//
//  CoinDetailsView.swift
//  canCrypto
//
//  Created by Maciej on 22/03/2023.
//

import SwiftUI
import Kingfisher

struct CoinDetailsView: View {
    // MARK: - Properties
    private let viewModel: CoinDetailsViewModel
    
    // MARK: - Init
    init(coin: CoinModel) {
        self.viewModel = CoinDetailsViewModel(coin: coin)
    }
    
    // MARK: - Body
    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 32) {
                    // MARK: - Chart
                    ChartView(viewModel: viewModel)
                    
                    // MARK: - Overview
                    CoinDetailsSection(model: viewModel.overviewSectionModel)
                    
                    // MARK: - Additional Details
                    CoinDetailsSection(model: viewModel.additionalSectionModel)
                }
                .padding()
            }
            .navigationTitle(viewModel.coinName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Text(viewModel.coinSymbol.uppercased())
                            .fontWeight(.semibold)
                        
                        KFImage(viewModel.coinImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }
                }
            }
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CoinDetailsView(coin: dev.coin)
        }
        .preferredColorScheme(.dark)
    }
}
