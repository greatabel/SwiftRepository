//: Playground - noun: a place where people can play
import UIKit

func distanceBetweenPoint(point: CGPoint, toPoint: CGPoint) -> Double {
    let dx = Double(toPoint.x - point.x)
    let dy = Double(toPoint.y - point.y)
    return sqrt(dx * dx + dy * dy)
}

let origin: CGPoint = CGPoint(x: 0, y: 0)
let point: CGPoint = CGPoint(x: 1, y: 1)

let distance: Double =  distanceBetweenPoint(point: origin, toPoint: point)
print("distance = \(distance)")


typealias Location = CGPoint
typealias Distance = Double

func distanceBetweenPoint_New(location: Location,
    toLocation: Location) -> Distance {
        let dx = Distance(location.x - toLocation.x)
        let dy = Distance(location.y - toLocation.y)
        return sqrt(dx * dx + dy * dy)
}

let origin_New: Location = Location(x: 0, y: 0)
let point_New: Location = Location(x: 1, y: 1)

let distance_New: Distance =  distanceBetweenPoint_New(location:origin_New,
                                toLocation: point_New)
print("distance_New = \(distance_New)")

