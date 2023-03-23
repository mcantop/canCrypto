//
//  StatisticModel.swift
//  canCrypto
//
//  Created by Maciej on 22/03/2023.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    var isPositive: Bool? {
        if let percentageChange = percentageChange {
            return percentageChange > 0
        }
        
        return nil
    }
}
