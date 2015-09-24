//
//  ViewController.swift
//  testChart
//
//  Created by 万畅 on 15/9/15.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,PNChartDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var lineChart:PNLineChart = PNLineChart(frame: CGRectMake(0, 135.0, 320, 200.0))
        lineChart.yLabelFormat = "%1.1f"
        lineChart.showLabel = true
        lineChart.backgroundColor = UIColor.clearColor()
        lineChart.xLabels = ["SEP 1","SEP 2","SEP 3","SEP 4","SEP 5","SEP 6","SEP 7"]
        lineChart.showCoordinateAxis = true
        lineChart.delegate = self

        // Line Chart Nr.1
        var data01Array: [CGFloat] = [60.1, 160.1, 126.4, 262.2, 186.2, 127.2, 176.2]
        var data01:PNLineChartData = PNLineChartData()


        data01.getData() = {
            index in
            let yValue: CGFloat = initSignalExample[UInt(index)]
            return PNLineChartDataItem(y: yValue)
        }

        lineChart.chartData = [data01]
        lineChart.strokeChart()

               lineChart.delegate = self
        self.view.addSubview(lineChart)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

