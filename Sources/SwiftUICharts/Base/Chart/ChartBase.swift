import SwiftUI

/// Protocol for any type of chart, to get access to underlying data
public protocol ChartBase {
    var chartData: ChartData { get }
}

public protocol MultiLineChartBase {
    var multiLineChartData: MultiLineChartData { get }
}
