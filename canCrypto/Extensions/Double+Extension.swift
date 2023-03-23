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
    
    func toNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    // TODO: Change name to more appropriate
    func kFormatted() -> String {
        let num = abs(self)
        let sign = (self < 0) ? "-" : ""
        
        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let formattedString = formatted.toNumberString()
            return "\(sign)\(formattedString)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let formattedString = formatted.toNumberString()
            return "\(sign)\(formattedString)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let formattedString = formatted.toNumberString()
            return "\(sign)\(formattedString)M"
        case 1_000...:
            let formatted = num / 1_000
            let formattedString = formatted.toNumberString()
            return "\(sign)\(formattedString)K"
        case 0...:
            return self.toNumberString()
        default:
            return "\(sign)\(self)"
        }
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
