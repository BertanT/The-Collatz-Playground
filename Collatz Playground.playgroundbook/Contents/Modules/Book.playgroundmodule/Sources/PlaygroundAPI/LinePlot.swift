//
//  LinePlot.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit

/// Draws a line plot on the chart.
///
/// Properties that can affect the line plot:
///
///   - `color`. The color to use for symbols and lines.
///   - `lineWidth`. The width of the line. The default value is 4.0.
///   - `symbol`. The symbol to use for points along the line. The default value is .circle.
///   - `style`. The style to use to draw the line (for example, solid, dashed, and so on). The default value is .solid.
/// - localizationKey: LinePlot
public class LinePlot: AbstractPointPlot {
    
    /// Creates a line plot with the given (x,y) data. The data is sorted in ascending x order.
    /// - localizationKey: LinePlot(xyData: (Double, Double))
    public convenience init(xyData: (Double, Double)...) {
        let xyData = XYData(xyData: xyData)
        self.init(xyData: xyData)
    }
    
    /// Creates a line plot with the given y data, starting at x=0 with an x-stride of 1.0. The data is sorted in ascending x order.
    /// - Parameter yData: The y data.
    /// - localizationKey: LinePlot(yData:)
    public convenience init(yData: Double...) {
        let xyData = XYData(yData: yData)
        self.init(xyData: xyData)
    }
    
    /// Creates a line plot with the given (x,y) data. The data is sorted in ascending x order.
    /// - Parameter xyData: The (x,y) data.
    /// - localizationKey: LinePlot(xyData:)
    public init(xyData: XYData) {
        
        xyData.sort()
        
        let dataProvider = DiscreteLineData(xyData: xyData)
        super.init(dataProvider: dataProvider, style: .solid)
        
        // When the point data changes, redraw the graph layer.
        xyData.dataDidChangeHandler = { 
            Chart.shared.backingView.setNeedsDisplay()
        }
    }
    
    /// Creates a line plot with the given function. The function is called with an x value and must return the corresponding y value.
    /// - Parameter function: The function used to calculate y values.
    /// - localizationKey: LinePlot(function:)
    public init(function: @escaping (Double) -> Double) {
        let dataProvider = FunctionLineData(function: function)
        super.init(dataProvider: dataProvider, symbol: nil, style: .solid)
    }
    
}
