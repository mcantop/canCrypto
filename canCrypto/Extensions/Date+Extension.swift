//
//  Date+Extension.swift
//  canCrypto
//
//  Created by Maciej on 22/03/2023.
//

import Foundation

extension Date {
    // 2023-03-22T22:27:17.301Z
    
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    func asShortDateString() -> String {
        return shortDateFormatter.string(from: self)
    }
    
    private var shortDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter
    }
}
