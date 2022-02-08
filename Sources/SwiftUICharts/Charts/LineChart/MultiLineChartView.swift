//
//  SwiftUIView.swift
//  
//
//  Created by Mike Mahon on 2/7/22.
//

import SwiftUI



struct MultiLineChartView: View {
    //@EnvironmentObject var chartValue: ChartValue
    public var multiLineChart = MultiLineChartData()

    @State private var showIndicator: Bool = false
    @State private var touchLocation: CGPoint = .zero
    @State private var showBackground: Bool = true
    @State private var didCellAppear: Bool = false
    @State var interactionEnabled: Bool = true

    var curvedLines: Bool = true
    
//    func getPath(data: ChartData) -> Path {
//        return Path.quadCurvedPathWithPoints(points: data.normalisedPoints,
//                                             step: CGPoint(x: 1.0, y: 1.0))
//    }
    
    /// The content and behavior of the `Line`.
    /// Draw the background if showing the full line (?) and the `showBackground` option is set. Above that draw the line, and then the data indicator if the graph is currently being touched.
    /// On appear, set the frame so that the data graph metrics can be calculated. On a drag (touch) gesture, highlight the closest touched data point.
    /// TODO: explain rotation
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(multiLineChart.chartDataSets, id:\.id) { chart in
                    if self.didCellAppear && chart.style.showBackground {
                        LineBackgroundShapeView(chartData: chart.data,
                                                geometry: geometry,
                                                style: chart.style)
                    }
                    LineShapeView(chartData: chart.data,
                                  geometry: geometry,
                                  style: chart.style,
                                  trimTo: didCellAppear ? 1.0 : 0.0)
                        .animation(interactionEnabled ? .easeIn : .none)
                }
            }
            .onAppear {
                didCellAppear = true
            }
            .onDisappear() {
                didCellAppear = false
            }
        }
    }
}

struct MultiLineChartView_Previews: PreviewProvider {
    static let redLineStyle = ChartStyle(backgroundColor: .whiteBlack, foregroundColor: ColorGradient(.red), showBackground: false)
    static let blueLineStyle = ChartStyle(backgroundColor: .whiteBlack, foregroundColor: ColorGradient(.blue), showBackground: false)
    //static let multiLineChart = MultiLineChartData(chartDataSets: [ChartDataSet(data: ChartData([0,0,0,1], globalMaxY: 100), style: redLineStyle)])
    
    static let secondaryDataSet = ChartData([("J", 15.0), ("F", 16.0)], globalMaxY: 35, scaleFactor: 0.48, expectedPointCount: 12)
    static let primaryDataSet = ChartData([("J", 0.0), ("F", 0.0), ("M", 0.0), ("A", 0.0), ("M", 0.0), ("J", 0.0), ("J", 0.0), ("A", 0.0), ("S", 0.0), ("O", 4.0), ("N", 22.0), ("D", 35.0)])
    
    static let multiLineChart = MultiLineChartData(chartDataSets: [ChartDataSet(data: secondaryDataSet, style: blueLineStyle), ChartDataSet(data: primaryDataSet, style: redLineStyle)])
    
    
    static var previews: some View {
        MultiLineChartView(multiLineChart: multiLineChart)
    }
}
