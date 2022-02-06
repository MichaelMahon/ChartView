import SwiftUI

/// A single vertical bar in a `BarChart`
public struct BarChartCell: View {
    var value: Double
    var label: String?
    var labelColor: Color
    var labelFont: Font?
    var index: Int = 0
    var width: Float
    var numberOfDataPoints: Int
    var gradientColor: ColorGradient
    var touchLocation: CGFloat

    var cellWidth: Double {
        return Double(width)/(Double(numberOfDataPoints) * 1.5)
    }

    @State private var firstDisplay: Bool = true

    public init( value: Double,
                 label: String? = nil,
                 labelColor: Color? = nil,
                 labelFont: Font? = nil,
                 index: Int = 0,
                 width: Float,
                 numberOfDataPoints: Int,
                 gradientColor: ColorGradient,
                 touchLocation: CGFloat) {
        self.value = value
        self.label = label
        self.labelColor = labelColor ?? Color(UIColor.label)
        self.labelFont = labelFont
        self.index = index
        self.width = width
        self.numberOfDataPoints = numberOfDataPoints
        self.gradientColor = gradientColor
        self.touchLocation = touchLocation
    }

	/// The content and behavior of the `BarChartCell`.
	///
	/// Animated when first displayed, using the `firstDisplay` variable, with an increasing delay through the data set.
    public var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(gradientColor.linearGradient(from: .bottom, to: .top))
                if label != nil {
                    Text(label!)
                        .foregroundColor(labelColor)
                        .font(labelFont)
                }
            }
        }
        .frame(width: CGFloat(self.cellWidth))
        .scaleEffect(CGSize(width: 1, height: self.firstDisplay ? 0.0 : self.value), anchor: .bottom)
        .onAppear {
            self.firstDisplay = false
        }
        .onDisappear {
            self.firstDisplay = true
        }
        .transition(.slide)
        .animation(Animation.spring().delay(self.touchLocation < 0 || !firstDisplay ? Double(self.index) * 0.04 : 0))
    }
}

struct BarChartCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Group {
                BarChartCell(value: 0, label: "T", width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.greenRed, touchLocation: CGFloat())

                if #available(iOS 14.0, *) {
                    BarChartCell(value: 1, label: "T", labelColor: .red, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.greenRed, touchLocation: CGFloat())
                } else {
                    // Fallback on earlier versions
                }
                BarChartCell(value: 1, label: "T", width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.whiteBlack, touchLocation: CGFloat())
                BarChartCell(value: 1, label: "T", width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient(.purple), touchLocation: CGFloat())
            }

            Group {
                BarChartCell(value: 1, label: "T", width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.greenRed, touchLocation: CGFloat())
                BarChartCell(value: 1, label: "T", width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.whiteBlack, touchLocation: CGFloat())
                BarChartCell(value: 1, label: "T", width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient(.purple), touchLocation: CGFloat())
                    .preferredColorScheme(.dark)
            }.environment(\.colorScheme, .dark)
        }
    }
}
