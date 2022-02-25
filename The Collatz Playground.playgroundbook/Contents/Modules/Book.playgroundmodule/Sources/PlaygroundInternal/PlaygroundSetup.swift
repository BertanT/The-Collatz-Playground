//
//  PlaygroundSetup.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//

import UIKit
import PlaygroundSupport

class ChartViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    override func loadView() {
        self.view = Chart.shared.chartView
    }
    
    override func viewDidLoad() {
        if let chartView = view as? ChartView {
            chartView.chartSafeAreaLayoutGuide = liveViewSafeAreaGuide
        }
    }
    
}

public func _setup() {
    PlaygroundPage.current.liveView = ChartViewController()
}
