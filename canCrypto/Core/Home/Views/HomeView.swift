//
//  HomeView.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @StateObject var viewModel = HomeViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    TopMoversView(homeViewModel: viewModel)
                        .opacity(viewModel.isLoading ? 0 : 1)
                    
                    Divider().padding(.vertical, 6)
                    
                    AllCoinsView(homeViewModel: viewModel)
                        .opacity(viewModel.isLoading ? 0 : 1)
                }
                
                if viewModel.isLoading {
                    LoadingIndicator()
                }
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
