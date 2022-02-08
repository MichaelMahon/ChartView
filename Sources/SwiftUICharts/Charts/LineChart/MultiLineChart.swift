//
//  SwiftUIView.swift
//  
//
//  Created by Mike Mahon on 2/7/22.
//

import SwiftUI

public struct MultiLineChart: View, MultiLineChartBase {
    public var multiLineChartData = MultiLineChartData()
    
    @State var interactionEnabled: Bool
    
    @EnvironmentObject var multiLineData: MultiLineChartData
    
    public var body: some View {
        MultiLineChartView(multiLineChart: multiLineData, interactionEnabled: interactionEnabled)
    }
    
    public init(interactionEnabled: Bool = true) {
        self.interactionEnabled = interactionEnabled
    }
}
