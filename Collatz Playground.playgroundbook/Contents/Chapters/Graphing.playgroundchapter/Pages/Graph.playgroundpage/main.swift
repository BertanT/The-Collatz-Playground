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
// Collatz Playground
// Created by Bertan on 27.10.2021
// Copyright 2021 Mehmet Mehmet Bertan Tarakçıoğlu, Licsensed under the MIT Licsense

import Foundation

func collatzPlot(startPoint: Int) {
    // Initialize n with input
    var n = Double(startPoint)
    
    // Initializing graph dat a with the starting point
    var data = XYData()
    data.append(x: 1, y: n)
    
    // Declaring a varibale to keep count of all steps - start with 2 as the first step is the input number
    var step: Double = 2
    
    // Repeat the function while not in the 5 currently known loops of the conjecture
    while n != 0, n != 1, n != -1, n != -5, n != -17 {
        // Check is the number is even or odd, then roceed with the aporapiate operation
        if n.truncatingRemainder(dividingBy: 2) == 0 {
            // Number is even -> x/2
            n = n / 2
        }else {
            // Number is odd -> 3x+1
            n = 3 * n + 1
        }
        // Add the current value of n to the graph
        data.append(x: step, y: n)
        //Increment the step count
        step += 1
    }
    // Draw the graph once the conjecture reaches to a loop
    LinePlot(xyData: data)
}

// Example use of the function
collatzPlot(startPoint: 345674)
//#-end-editable-code
