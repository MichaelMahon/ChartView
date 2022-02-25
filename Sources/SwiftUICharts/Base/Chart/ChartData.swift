import SwiftUI

public class ChartDataSet: ObservableObject {
    @State var id = UUID()
    @Published public var data: ChartData
    @Published public var style: ChartStyle
    
    public init(data: ChartData, style: ChartStyle) {
        self.data = data
        self.style = style
    }
}

public class MultiLineChartData: ObservableObject, Identifiable {
    @Published public var chartDataSets = [ChartDataSet]()
    
    public init(chartDataSets: [ChartDataSet]) {
        self.chartDataSets = chartDataSets
    }
    
    public init() {
        
    }
}

/// An observable wrapper for an array of data for use in any chart
public class ChartData: ObservableObject {
    @Published public var data: [(String, Double)] = []
    @Published public var scaleFactor: CGFloat?
    @Published public var expectedPointCount: CGFloat?
    @Published var showLabels: Bool = false

    var points: [Double] {
        data.map { $0.1 }
    }

    var values: [String] {
        data.map { $0.0 }
    }

    var normalisedPoints: [Double] {
        let absolutePoints = points.map { abs($0) }
        return points.map { $0 / (absolutePoints.max() ?? 1.0) }
    }

    var normalisedRange: Double {
        return (normalisedPoints.max() ?? 0.0) - (normalisedPoints.min() ?? 0.0)
    }

    var isInNegativeDomain: Bool {
        (points.min() ?? 0.0) < 0
    }

    /// Initialize with data array
    /// - Parameter data: Array of `Double`
    public init(_ data: [Double], scaleFactor: CGFloat? = nil, expectedPointCount: CGFloat? = nil, showLabels: Bool = false) {
        self.data = data.map { ("", $0) }
        self.scaleFactor = scaleFactor
        self.expectedPointCount = expectedPointCount
        self.showLabels = showLabels
    }

    public init(_ data: [(String, Double)], scaleFactor: CGFloat? = nil, expectedPointCount: CGFloat? = nil, showLabels: Bool = false) {
        self.data = data
        self.scaleFactor = scaleFactor
        self.expectedPointCount = expectedPointCount
        self.showLabels = showLabels
    }

    public init() {
        self.data = []
    }
}
