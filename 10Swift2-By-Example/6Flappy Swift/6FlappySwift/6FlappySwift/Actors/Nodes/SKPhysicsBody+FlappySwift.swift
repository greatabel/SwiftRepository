import SpriteKit

extension SKPhysicsBody {
    typealias BodyBuilderClosure = (SKPhysicsBody) -> ()

    class func rectSize(size: CGSize,
                        builderClosure: BodyBuilderClosure) -> SKPhysicsBody {
        let body = SKPhysicsBody(rectangleOf: size)
        builderClosure(body)
        return body
    }
}

