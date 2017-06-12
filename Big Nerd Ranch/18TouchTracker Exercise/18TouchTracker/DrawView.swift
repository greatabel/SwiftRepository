import UIKit
import Foundation

class DrawView: UIView {
//    var currentLine: Line?
    var currentLines = [NSValue:Line]()
    var finishedLines = [Line]()

    @IBInspectable var finishedLineColor: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var currentLineColor: UIColor = UIColor.red {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var linethickness: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }



    // stroke=描边
    func stroke(_ line: Line) {
        //Bezier=贝塞尔曲线
//        let path = UIBezierPath()
////        path.lineWidth = 10
//        path.lineWidth = linethickness
//        path.lineCapStyle = .round
//
//        path.move(to: line.begin)
//        path.addLine(to: line.end)
//        path.stroke()
        // https://stackoverflow.com/questions/29616992/how-do-i-draw-a-circle-in-ios-swift
        var x = (line.begin.x + line.end.x )/2
        var y = (line.begin.y + line.end.y )/2
        var r = sqrt( pow((line.end.x - line.begin.x), 2) +
            pow((line.end.y - line.begin.y),2) )

//        let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth:CGFloat = 1    // your desired value

        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:x,y:y),
            radius: r,
            startAngle: CGFloat(0),
            endAngle:CGFloat(M_PI * 2),
            clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath

        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = desiredLineWidth

        layer.addSublayer(shapeLayer)


    }

    override func draw(_ rect: CGRect) {

//        UIColor.black.setStroke()
        finishedLineColor.setStroke()
        for line in finishedLines{
            stroke(line)
        }
//        if let line = currentLine {
//            UIColor.red.setStroke()
//            stroke(line)
//        }
//            UIColor.red.setStroke()
        currentLineColor.setStroke()
        for(_, line) in currentLines {

            stroke(line)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first!
        // Get location of the touch in view's coordinate system

//        let location = touch.location(in: self)
//        currentLine = Line(begin: location, end: location)
        print(#function)
        for touch in touches {
            let location = touch.location(in: self)

            let newLine = Line(begin: location, end: location)
            let key = NSValue(nonretainedObject: touch)
            currentLines[key] = newLine
        }
        setNeedsDisplay()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first!
//        let location = touch.location(in: self)
//        currentLine?.end = location
        print(#function)
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            currentLines[key]?.end = touch.location(in: self)
        }
        setNeedsDisplay()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if var line = currentLine {
//            let touch = touches.first!
//            let location = touch.location(in: self)
//            line.end = location
//            finishedLines.append(line)
//        }
//        currentLine = nil
        print(#function)
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            if var line = currentLines[key] {
                line.end = touch.location(in: self)
                finishedLines.append(line)
                currentLines.removeValue(forKey: key)
            }
        }
        setNeedsDisplay()
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        currentLines.removeAll()
        setNeedsDisplay()
    }

}
