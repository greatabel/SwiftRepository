import UIKit

class PathDrawing: UIView {

    override func draw(_ rect: CGRect) {

        // Build the Path
        //let path = simpleRectPath()
        //let path = simpleMutableRectPath()
        //let path = simpleLine()
        //let path = multiLine()
        let path = simpleCurve()

        // Draw the path
        let context = UIGraphicsGetCurrentContext()
        UIColor.red.set()

        context!.addPath(path)
//        CGContextDrawPath(context!, CGPathDrawingMode.stroke)
        context?.drawPath(using: CGPathDrawingMode.stroke)

    }

    // MARK:  Path composing

    func simpleRectPath()->CGPath {
        let rect = CGRect(x: 30, y: 30, width: 80, height: 80)
        let path = CGPath(rect: rect, transform: nil)

        return path
    }

    func simpleMutableRectPath()->CGMutablePath {
        let rect = CGRect(x: 30, y: 30, width: 80, height: 80)
        let path = CGMutablePath()
//        CGPathAddRect(path, nil, rect)
        path.addRect(rect)

        return path
    }

    func simpleLine()->CGMutablePath{

        let path = CGMutablePath()
//        CGPathMoveToPoint(path, nil, 20, 20)
        path.move(to: CGPoint(x: 20, y: 20))
//        CGPathAddLineToPoint(path, nil, 100, 100)
        path.addLine(to: CGPoint(x: 100,y: 100))
        return path
    }

    func multiLine()->CGMutablePath{
        let path = CGMutablePath()

//        CGPathMoveToPoint(path, nil, 20, 20)
        path.move(to: CGPoint(x:20, y:20))
//        CGPathAddLineToPoint(path, nil, 100, 100)
        path.addLine(to: CGPoint(x: 100,y: 100))
//        CGPathAddLineToPoint(path, nil, 200, 50)
        path.addLine(to: CGPoint(x: 200,y: 50))
        path.closeSubpath()

        return path
    }

    func simpleCurve()->CGMutablePath{

        let path = CGMutablePath()
//        CGPathMoveToPoint(path, nil, 20, 20)
        path.move(to: CGPoint(x:20, y:20))
//        CGPathAddQuadCurveToPoint(path, nil, 100, 20, 100, 100)
        path.addQuadCurve(to: CGPoint(x: 100, y: 20), control: CGPoint(x:100, y:100))
        return path
    }


    // MARK: Path Drawing

    func drawPath(context:CGContext?){
        let rect = CGRect(x: 30, y: 30, width: 80, height: 80)
        let path = CGPath(rect: rect, transform: nil)

        UIColor.gray.setFill()
        UIColor.red.setStroke()

//        CGContextSetLineWidth(context!, 2.0)
        context?.setLineWidth(2.0)
        context!.setLineCap(CGLineCap.round)

//        CGContextAddPath(context!, path)
        context?.addPath(path)
//        CGContextDrawPath(context!, CGPathDrawingMode.FillStroke)
        context?.drawPath(using: CGPathDrawingMode.fillStroke)
        //CGContextStrokePath(context)
        //CGContextFillPath(context)
    }

}
