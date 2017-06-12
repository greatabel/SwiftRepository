import UIKit

class DrawView: UIView {
//    var currentLine: Line?
    var currentLines = [NSValue:Line]()
    var finishedLines = [Line]()

    var selectedLineIndex: Int? {
        didSet {
            if selectedLineIndex == nil {
                let menu = UIMenuController.shared
                menu.setMenuVisible(false, animated: true)
            }
        }
    }

    var moveRecognizer: UIPanGestureRecognizer!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let doubleTapRecognizer = UITapGestureRecognizer(target: self,
                                                         action: #selector(DrawView.doubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        // 防止单个点
        doubleTapRecognizer.delaysTouchesBegan = true
        addGestureRecognizer(doubleTapRecognizer)


        let tapRecognizer = UITapGestureRecognizer(target: self,
                                                   action: #selector(DrawView.tap(_:)))
        tapRecognizer.delaysTouchesBegan = true
        tapRecognizer.require(toFail: doubleTapRecognizer)
        addGestureRecognizer(tapRecognizer)

        let longPressRecognizer = UILongPressGestureRecognizer(target: self,
                                               action: #selector(DrawView.longPress(_:)))
        addGestureRecognizer(longPressRecognizer)

        moveRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DrawView.moveLine(_:)))
        addGestureRecognizer(moveRecognizer)

    }

    func moveLine(_ gestureRecognizer: UIGestureRecognizer) {
        print(#function)
    }

    func longPress(_ gestureRecognizer: UIGestureRecognizer) {
        print(#function)
        if gestureRecognizer.state == .began {
            let point = gestureRecognizer.location(in: self)
            selectedLineIndex = indexOfLine(at: point)

            if selectedLineIndex != nil {
                currentLines.removeAll()
            }
        } else if gestureRecognizer.state == .ended {
            selectedLineIndex = nil
        }
        setNeedsDisplay()
    }

    func doubleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        print("Recognizer a double tap")
        selectedLineIndex = nil
        currentLines.removeAll()
        finishedLines.removeAll()
        setNeedsDisplay()
    }

    func tap(_ gestureRecognizer: UITapGestureRecognizer){
        print("Recognized a tap")
        let point = gestureRecognizer.location(in: self)
        selectedLineIndex = indexOfLine(at: point)

        let menu = UIMenuController.shared

        if selectedLineIndex != nil {

            // Make DrawView the target of menu item action messages
            becomeFirstResponder()
            // Create a new "Delete" UIMenuItem
            let deleteItem = UIMenuItem(title: "Delete",
                                        action: #selector(DrawView.deleteLine(_:)))
            menu.menuItems = [deleteItem]

            // Tell the menu where it should come from and show it
            let targetRect = CGRect(x: point.x, y: point.y, width: 2, height: 2)
            menu.setTargetRect(targetRect, in: self)
            menu.setMenuVisible(true, animated: true)

        } else {
            // Hide the menu if no line is selected
            menu.setMenuVisible(false, animated: true)
        }

        setNeedsDisplay()
    }

    func deleteLine(_ sender: UIMenuController){
        print(#function)
        if let index = selectedLineIndex {
            finishedLines.remove(at: index)
            selectedLineIndex = nil
            setNeedsDisplay()
        }

    }

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

    func indexOfLine(at point: CGPoint) -> Int? {
        // Find a line close to point
        for (index, line) in finishedLines.enumerated() {
            let begin = line.begin
            let end = line.end

            // Check a few points on the line
            for t in stride(from: CGFloat(0), to: 1.0, by: 0.05) {
                let x = begin.x + ((end.x - begin.x) * t)
                let y = begin.y + ((end.y - begin.y) * t)
                // If the tapped point is within 20 points, let's return this line
                if hypot(x - point.x, y - point.y) < 20.0 {
                    return index
                }
            }
        }
        return nil
    }

    override var canBecomeFirstResponder: Bool {
        return true
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

        if let index = selectedLineIndex {
            UIColor.green.setStroke()
            let selectedLine = finishedLines[index]
            stroke(selectedLine)
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
