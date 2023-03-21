//
//  Double+Extension.swift
//  canCrypto
//
//  Created by Maciej on 21/03/2023.
//

import Foundation

extension Double {
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func toPercent() -> String {
        return (numberFormatter.string(for: self) ?? "0.00") + "%"
    }
}

// MARK: - Private Helpers
private extension Double {
    var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
}
