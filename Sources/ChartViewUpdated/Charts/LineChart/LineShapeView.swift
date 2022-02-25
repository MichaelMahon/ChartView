import SwiftUI

struct LineShapeView: View, Animatable {
    var chartData: ChartData
    var geometry: GeometryProxy
    var style: ChartStyle
    var trimTo: Double = 0
    @State var interactionEnabled: Bool = true

    var animatableData: CGFloat {
        get { CGFloat(trimTo) }
        set { trimTo = Double(newValue) }
    }

    var body: some View {
        LineShape(data: chartData.normalisedPoints)
            .trim(from: 0, to: CGFloat(trimTo))
            .transform(CGAffineTransform(scaleX: geometry.size.width / (chartData.expectedPointCount != nil ? chartData.expectedPointCount! : CGFloat(chartData.normalisedPoints.count - 1)),
                                         y: geometry.size.height / CGFloat(chartData.normalisedRange)))
            .transform(CGAffineTransform(scaleX: 1, y: chartData.scaleFactor != nil ? chartData.scaleFactor! : 1))
            .stroke(LinearGradient(gradient: style.foregroundColor.first?.gradient ?? ColorGradient.orangeBright.gradient,
                                   startPoint: .leading,
                                   endPoint: .trailing),
                    style: StrokeStyle(lineWidth: 3, lineJoin: .round))
            .rotationEffect(.degrees(180), anchor: .center)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .allowsHitTesting(interactionEnabled)
    }
}

//
//    .transform(CGAffineTransform(scaleX: geometry.size.width / CGFloat(chartData.normalisedPoints.count - 1),
//                                 y: geometry.size.height / (chartData.globalMaxY != nil ? chartData.globalMaxY! : CGFloat(chartData.normalisedRange))))//CGFloat(chartData.normalisedRange)))
