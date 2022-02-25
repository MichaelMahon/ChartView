//
//  File.swift
//  
//
//  Created by Mike Mahon on 2/5/22.
//

import Foundation
import SwiftUI

public class ChartLabelStyle: ObservableObject {
    @Published public var labelColor: Color?
    @Published public var labelFont: Font?


    public init(color: Color? = nil, font: Font? = nil) {
        self.labelColor = color
        self.labelFont = font
    }
}

extension View {

    /// Attach chart style to a View
    /// - Parameter style: chart style
    /// - Returns: `View` with chart style attached
    public func chartLabelStyle(_ style: ChartLabelStyle) -> some View {
        self.environmentObject(style)
    }
}
