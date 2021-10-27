//
//  AbstractPointPlot.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit

public enum LineStyle {
    case none
    case solid
    case dashed
    case dotted
    
    var isConnected: Bool {
        get {
            return self != .none
        }
    }
}

/// An abstract, point-based plot that supports drawing points on the screen as symbols and connecting them with lines.
/// - localizationKey: AbstractPointPlot
public class AbstractPointPlot {

    internal var linePlotDrawable: LinePlotDrawable
    
    /// The color of the line and symbols.
    /// - localizationKey: AbstractPointPlot.color
    public var color: Color {
        get {
            return linePlotDrawable.color
        }
        set {
            linePlotDrawable.color = newValue
        }
    }
    
    /// The stroke width of the line, in points.
    /// - localizationKey: AbstractPointPlot.lineWidth
    public var lineWidth: Double {
        get {
            return Double(linePlotDrawable.lineWidth)
        }
        set {
            linePlotDrawable.lineWidth = CGFloat(newValue)
        }
    }
    
    /// The symbols to draw at each point in the data set.
    /// - localizationKey: AbstractPointPlot.symbol
    public var symbol: Symbol? {
        get {
            return linePlotDrawable.symbol
        }
        set {
            linePlotDrawable.symbol = newValue
        }
    }

    /// The style to use to draw the line. The default value is .solid.
    /// - localizationKey: AbstractPointPlot.style
    public var style: LineStyle {
        get {
            return linePlotDrawable.lineStyle
        }
        set {
            linePlotDrawable.lineStyle = newValue
        }
    }
    
    public var label: String? {
        get {
            return linePlotDrawable.label
        }
        set {
            linePlotDrawable.label = newValue
        }
    }
    
    //MARK: initializers
    
    internal init(dataProvider: LineData, symbol: Symbol? = Symbol(), style: LineStyle = .none) {

        let chartView = Chart.shared.chartView
        linePlotDrawable = LinePlotDrawable()
        linePlotDrawable.dataProvider = dataProvider
        linePlotDrawable.color = Color.next()
        
        self.style = style
        self.symbol = symbol
        
        chartView.addChartDrawable(chartDrawable: linePlotDrawable)
    }
}

extension AbstractPointPlot: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        get {
            guard let dataProvider = linePlotDrawable.dataProvider else { return "" }
            return dataProvider.playgroundDescription
        }
    }
}

