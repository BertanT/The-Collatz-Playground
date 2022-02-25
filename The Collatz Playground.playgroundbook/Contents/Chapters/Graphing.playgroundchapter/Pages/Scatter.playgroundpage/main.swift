//#-hidden-code
//
//  main.swift
//  
//  Copyright © 2016-2020 Apple Inc. All rights reserved.
//
//#-end-hidden-code
//#-code-completion(module, hide, Swift)
//#-code-completion(identifier, hide, _setup(), AbstractPointChartable)
//#-hidden-code
_setup()
//#-end-hidden-code
//#-editable-code Tap to enter code.
//#-localizable-zone(scatterk1)
// 1. Create a scatter plot using symbols.
//#-end-localizable-zone
let symbolScatter = ScatterPlot(xyData: (1,3), (1.3,3.1), (1.7,3.4), (2,4.5), (2.25,4), (2.4,4.1), (2.5,3.85), (2.7,5.5), (3,6.25), (3.1,7.05), (3.5,7))
symbolScatter.color = #colorLiteral(red: 0, green: 0.1771291047, blue: 0.97898072, alpha: 1)

//#-localizable-zone(scatterk2)
// 2. Create a scatter plot using images.
//#-end-localizable-zone
let imageScatter = ScatterPlot(xyData: (1.25,7.5), (1.35,7.1), (1.5,7.2), (1.55,6.9),(1.55,7.4))
imageScatter.symbol = Symbol(imageNamed: "SwiftBird", size: 24)

//#-end-editable-code
