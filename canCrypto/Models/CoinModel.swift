//
//  CoinModel.swift
//  canCrypto
//
//  Created by Maciej on 21/03/2023.
//

import SwiftUI

struct CoinModel: Identifiable, Codable {
    /// NON-OPTIONAL
    let id: String
    let symbol: String
    let name: String
    let image: URL
    let marketCapRank: Int
    let currentPrice: Double
    let priceChange24h: Double
    let priceChangePercentage24h: Double
    /// OPTIONAL
    let marketCap: Double?
    let fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24h: Double?
    let low24h: Double?
    let marketCapChange24h: Double?
    let marketCapChangePercentage24h: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl: Double?
    let atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7d: SparklineIn7d?
    let priceChangePercentage24hInCurrency: Double?
}

extension CoinModel {
    struct SparklineIn7d: Codable {
        let price: [Double]
    }
    
    var percentageColor: Color {
        return self.priceChangePercentage24h > 0 ? .green : .red
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChange24h = "price_change_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case marketCapChange24h = "market_cap_change_24h"
        case marketCapChangePercentage24h = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7d = "sparkline_in_7d"
        case priceChangePercentage24hInCurrency = "price_change_percentage_24h_in_currency"
    }
}
