//
//  HomeViewModel.swift
//  canCrypto
//
//  Created by Maciej on 21/03/2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    // MARK: - Properties
    @Published var coins = [CoinModel]()
    @Published var topMovingCoins = [CoinModel]()
    
    // MARK: - Init
    init() {
        fetchCoinData()
    }
}

// MARK: - Public Helpers
extension HomeViewModel {
    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response code \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([CoinModel].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            } catch let error {
                print("DEBUG: Failed to decode with error: \(error)")
            }
        }
        .resume()
    }
    
    func configureTopMovingCoins() {
        let topMovingCoins = coins.sorted(by: { $0.priceChangePercentage24h > $1.priceChangePercentage24h })
        self.topMovingCoins = Array(topMovingCoins.prefix(5))
    }
}

// MARK: - Private Helpers
private extension HomeViewModel {
    
}
