//
//  StatisticView.swift
//  canCrypto
//
//  Created by Maciej on 22/03/2023.
//

import SwiftUI

struct StatisticView: View {
    // MARK: - Properties
    let model: StatisticModel
    
    private var triangleImage: Image? {
        return Image(
            systemName: model.isPositive ?? false
                ? "triangle.fill"
                : "arrowtriangle.down.fill"
        )
    }
    
    private var triangleColor: Color? {
        return model.isPositive ?? false ? .green : .red
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text(model.title)
                .font(.caption)
            
            Text(model.value)
                .font(.headline)
            
            if let percentageChange = model.percentageChange {
                HStack(spacing: 4) {
                    triangleImage
                    
                    Text(percentageChange.toPercent())
                        .fontWeight(.bold)
                }
                .font(.caption)
                .foregroundColor(triangleColor)
            }
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(model: dev.stat2)
    }
}
