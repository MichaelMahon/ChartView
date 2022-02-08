import SwiftUI

/// Descripton of colors/styles for any kind of chart
public class ChartStyle: ObservableObject {

	/// colors for background are of chart
	public let backgroundColor: ColorGradient
	/// colors for foreground fill of chart
    public let foregroundColor: [ColorGradient]
    
    public var showBackground: Bool = true

	/// Initialize with a single background color and an array of `ColorGradient` for the foreground
	/// - Parameters:
	///   - backgroundColor: a `Color`
	///   - foregroundColor: array of `ColorGradient`
    public init(backgroundColor: Color, foregroundColor: [ColorGradient], showBackground: Bool = true) {
        self.backgroundColor = ColorGradient.init(backgroundColor)
        self.foregroundColor = foregroundColor
        self.showBackground = showBackground
    }

	/// Initialize with a single background color and a single `ColorGradient` for the foreground
	/// - Parameters:
	///   - backgroundColor: a `Color`
	///   - foregroundColor: a `ColorGradient`
    public init(backgroundColor: Color, foregroundColor: ColorGradient, showBackground: Bool = true) {
        self.backgroundColor = ColorGradient.init(backgroundColor)
        self.foregroundColor = [foregroundColor]
        self.showBackground = showBackground
    }

	/// Initialize with a single background `ColorGradient` and a single `ColorGradient` for the foreground
	/// - Parameters:
	///   - backgroundColor: a `ColorGradient`
	///   - foregroundColor: a `ColorGradient`
    public init(backgroundColor: ColorGradient, foregroundColor: ColorGradient, showBackground: Bool = true) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = [foregroundColor]
        self.showBackground = showBackground
    }

	/// Initialize with a  single background `ColorGradient` and an array of `ColorGradient` for the foreground
	/// - Parameters:
	///   - backgroundColor: a `ColorGradient`
	///   - foregroundColor: array of `ColorGradient`
    public init(backgroundColor: ColorGradient, foregroundColor: [ColorGradient], showBackground: Bool = true) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.showBackground = showBackground
    }
    
}
