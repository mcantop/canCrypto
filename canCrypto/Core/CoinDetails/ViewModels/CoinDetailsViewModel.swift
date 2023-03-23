//
//  CoinDetailsViewModel.swift
//  canCrypto
//
//  Created by Maciej on 22/03/2023.
//

import Foundation

final class CoinDetailsViewModel: ObservableObject {
    // MARK: - Properties
    private let coin: CoinModel
    var chartData = [ChartModel]()
    var startDate = Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    var xAxisValues = [Date]()
    var yAxisValues = [Double]()
    
    var coinName: String {
        return coin.name
    }
    
    var coinSymbol: String {
        return coin.symbol
    }
    
    var coinImage: URL {
        return coin.image
    }
    
    var overviewSectionModel: CoinDetailsSectionModel {
        let priceStats = StatisticModel(
            title: "Current Price",
            value: coin.currentPrice.toCurrency(),
            percentageChange: coin.priceChangePercentage24h
        )
        
        let capStats = StatisticModel(
            title: "Market Capitalization",
            value: coin.marketCap?.kFormatted() ?? "",
            percentageChange: coin.marketCapChangePercentage24h
        )
        
        let rankStats = StatisticModel(
            title: "Rank",
            value: "\(coin.marketCapRank)",
            percentageChange: nil
        )
        
        let volumeStats = StatisticModel(
            title: "Volume",
            value: coin.totalVolume?.kFormatted() ?? "",
            percentageChange: nil
        )
        
        return CoinDetailsSectionModel(title: "Overview", stats: [priceStats, capStats, rankStats, volumeStats])
    }
    
    var additionalSectionModel: CoinDetailsSectionModel {
        let stats24High = StatisticModel(
            title: "24H High",
            value: coin.high24h?.toCurrency() ?? "",
            percentageChange: nil
        )
        
        let stats24Low = StatisticModel(
            title: "24H Low",
            value: coin.low24h?.toCurrency() ?? "",
            percentageChange: nil
        )
        
        let priceChange24H = StatisticModel(
            title: "24H Price Change",
            value: coin.priceChange24h.toCurrency(),
            percentageChange: coin.priceChangePercentage24h
        )
        
        let capChange24H = StatisticModel(
            title: "24H Market Cap Change",
            value: coin.marketCapChange24h?.kFormatted() ?? "",
            percentageChange: coin.marketCapChangePercentage24h
        )
        
        return CoinDetailsSectionModel(title: "Additional Details", stats: [stats24High, stats24Low, priceChange24H, capChange24H])
    }
    
    // MARK: - Init
    init(coin: CoinModel) {
        self.coin = coin
        configureChart()
        
        print("DEBUG: Coin is \(self.coinName)")
    }
}

// MARK: - Private Helpers
private extension CoinDetailsViewModel {
    func configureChart() {
        guard let priceData = coin.sparklineIn7d?.price else { return }
        self.endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        self.minPrice = priceData.min() ?? 0.0
        self.maxPrice = priceData.max() ?? 0.0
        self.yAxisValues = [minPrice, (minPrice + maxPrice ) / 2, maxPrice]
        self.xAxisValues = [startDate, endDate]
        
        var index = 0

        for price in priceData.reversed() {
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            let chartDataItem = ChartModel(date: date, price: price)
            self.chartData.append(chartDataItem)
            index += 1
        }
    }
}
