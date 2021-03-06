import UIKit

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
        let path = UIBezierPath()
//        path.lineWidth = 10
        path.lineWidth = linethickness
        path.lineCapStyle = .round

        path.move(to: line.begin)
        path.addLine(to: line.end)
        path.stroke()
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
