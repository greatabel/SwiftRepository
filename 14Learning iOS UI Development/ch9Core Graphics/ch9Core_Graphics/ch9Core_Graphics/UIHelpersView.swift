import UIKit
class UIHelpersView: UIView {

    override func draw(_ rect: CGRect) {
        drawRedRect()
        //drawBlendedRects()
        //cgToBezierRect()
    }

    func drawRedRect(){
        let rect =  CGRect(x:10,y:10, width:80, height:80)
        UIColor.red.setFill()
        UIColor.black.setStroke()
        UIRectFill(rect)
        UIRectFrame(rect)
    }

    func drawBlendedRects(){
        let rect_A =  CGRect(x:10,y:10, width:80, height:80)
        UIColor.green.setFill()
        UIRectFill(rect_A)

        let rect_B = CGRect(x: 30,y:30,width: 80,height: 80)
        UIColor.red.setFill()
        UIRectFillUsingBlendMode(rect_B, CGBlendMode.multiply)
    }

    func drawBezierRect(){
        let rect = CGRect(x:10,y:10, width:80, height:80)
        let path = UIBezierPath(rect: rect)

        UIColor.blue.setStroke()
        path.lineWidth = 5
        path.stroke()
    }

    func drawBezierCircle(){
        let rect =  CGRect(x:10,y:10, width:80, height:80)
        let path = UIBezierPath(ovalIn: rect)

        UIColor.blue.setStroke()
        path.lineWidth = 5
        path.stroke()
    }

    func cgToBezierRect(){
        let rect =  CGRect(x:10,y:10, width:80, height:80)
        let cgPath = CGMutablePath()


        cgPath.addRect(rect)
//        CGPathAddEllipseInRect(cgPath, zoom, rect)

        let bezierPath = UIBezierPath()
        bezierPath.cgPath = cgPath

        UIColor.green.setStroke()
        bezierPath.lineWidth = 5
        bezierPath.stroke()
    }
}

