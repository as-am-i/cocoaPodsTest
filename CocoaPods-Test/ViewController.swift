//
//  ViewController.swift
//  CocoaPods-Test
//
//  Created by 谷井朝美 on 2018-07-18.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

import UIKit
import ScrollableGraphView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let frame = CGRect(x:0, y:0, width:view.bounds.width, height:view.bounds.height)
        let graphView = ScrollableGraphView(frame: frame, dataSource: self)
        
        let linePlot = LinePlot(identifier: "line") // Identifier should be unique for each plot.
        let referenceLines = ReferenceLines()
        
        graphView.addPlot(plot: linePlot)
        graphView.addReferenceLines(referenceLines: referenceLines)
        
        self.view.addSubview(graphView)
    }
    
    let linePlotData:[Double] = [1, 5, 8, 2, 6, 10]
    let numberOfDataPointsInGraph = 6
}

extension ViewController: ScrollableGraphViewDataSource {
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        // Return the data for each plot.
        switch(plot.identifier) {
        case "line":
            return linePlotData[pointIndex]
        default:
            return 0
        }
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return "FEB \(pointIndex)"
    }
    
    func numberOfPoints() -> Int {
        return numberOfDataPointsInGraph
    }
    
//    func createGraph(frame: CGRect) {
//        frame = CGRect(x:100.0, y:100.0, width:200.0, height:200.0)
//
//        let graphView = ScrollableGraphView(frame: frame, dataSource: self.data)
//
//        let linePlot = LinePlot(identifier: "line") // Identifier should be unique for each plot.
//        let referenceLines = ReferenceLines()
//
//        graphView.addPlot(plot: linePlot)
//        graphView.addReferenceLines(referenceLines: referenceLines)
//    }

}
