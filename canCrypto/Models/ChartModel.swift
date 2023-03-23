//
//  ChartModel.swift
//  canCrypto
//
//  Created by Maciej on 22/03/2023.
//

import Foundation

struct ChartModel: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let price: Double
}
