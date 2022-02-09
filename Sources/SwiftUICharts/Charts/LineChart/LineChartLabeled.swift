//
//  SwiftUIView.swift
//  
//
//  Created by Mike Mahon on 2/8/22.
//

import SwiftUI

struct LineChartLabeled: View {
    @ObservedObject var chartData: ChartData
    
    var style: ChartStyle
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Line(chartData: chartData, style: style)
                HStack(spacing: (geometry.size.width / CGFloat((chartData.values.count))) * 2) {
                    ForEach(0..<chartData.values.count) { index in
                        if index % 2 == 0 {
                            Text(chartData.values[index])
                        }
                    }
                }
            }
        }
    }
}

struct LineChartLabeled_Previews: PreviewProvider {
    static let redLineStyle = ChartStyle(backgroundColor: .whiteBlack, foregroundColor: ColorGradient(.red), showBackground: false)
    
    static var previews: some View {
        LineChartLabeled(chartData:  ChartData([("1", 0.0), ("2", 0.0), ("3", 0.0), ("4", 1.0), ("5", 1.0), ("6", 1.0), ("7", 1.0), ("8", 1.0)]), style: redLineStyle)
    }
}
