//
//  ChartView.swift
//  canCrypto
//
//  Created by Maciej on 22/03/2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    // MARK: - Properties
    let viewModel: CoinDetailsViewModel
    
    // MARK: - Body
    var body: some View {
        Chart {
            ForEach(viewModel.chartData) { item in
                LineMark(
                    x: .value("Date", item.date),
                    y: .value("Price", item.price)
                )
                .interpolationMethod(.cardinal)
            }
        }
        .foregroundStyle(.blue)
        .chartXScale(domain: ClosedRange(
            uncheckedBounds: (lower: viewModel.startDate, upper: viewModel.endDate)
        ))
        .chartYScale(domain: ClosedRange(
            uncheckedBounds: (lower: viewModel.minPrice, upper: viewModel.maxPrice)
        ))
        .chartXAxis {
            AxisMarks(position: .bottom, values: viewModel.xAxisValues) { value in
                AxisGridLine()
                AxisValueLabel() {
                    if let dateValue = value.as(Date.self) {
                        Text(dateValue.asShortDateString())
                    }
                }
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading, values: viewModel.yAxisValues) { value in
                AxisGridLine()
                AxisValueLabel() {
                    if let doubleValue = value.as(Double.self) {
                        Text(doubleValue.kFormatted())
                    }
                }
            }
        }
        .frame(height: 250)
        .padding(.vertical)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(viewModel: CoinDetailsViewModel(coin: dev.coin))
    }
}
