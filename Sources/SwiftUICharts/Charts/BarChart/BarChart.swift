import SwiftUI

/// A type of chart that displays vertical bars for each data point
public struct BarChart: View, ChartBase {
    public var chartData = ChartData()

    @EnvironmentObject var data: ChartData
    @EnvironmentObject var style: ChartStyle
    @EnvironmentObject var chartLabelStyle: ChartLabelStyle
    @State var interactionEnabled: Bool

	/// The content and behavior of the `BarChart`.
	///
	///
    public var body: some View {
        BarChartRow(chartData: data, chartLabelStyle: chartLabelStyle, interactionEnabled: interactionEnabled, style: style)
    }

    public init(interactionEnabled: Bool = true) {
        self.interactionEnabled = interactionEnabled
    }
}
