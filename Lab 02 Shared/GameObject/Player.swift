//
//  Player.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-18.
//

import SpriteKit

class Player : SKShapeNode, GameObject, Observer {
    
    private let size: CGFloat = 50
    private var moveSpeed: CGFloat = 350.0
    
    init(rootNode: SKScene) {
        super.init()
        
        path = SKShapeNode(circleOfRadius: size).path
        
        physicsBody = SKPhysicsBody(circleOfRadius: size)
        physicsBody?.isDynamic = false
        physicsBody?.contactTestBitMask = physicsBody!.collisionBitMask
        
        physicsBody = physicsBody
        
        rootNode.addChild(self)
        
        let startPosition = CGPoint(x: 0.0, y: -rootNode.bounds.maxY + (bounds.height / 2))
        
        position = startPosition
        
        strokeColor = SKColor.black
        fillColor = SKColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move(location: CGPoint){
        let direction = location.x - position.x
        
        let destination = CGPoint(x: location.x, y: position.y)
        
        run(SKAction.move(to: destination, duration: direction.magnitude / moveSpeed))
    }
    
    func collidedWith(object: SKNode){
        guard object is Item else { return }
        
        if object is Collectable {
            
            ScoreTracker.instance.score += 1
            run(SKAction.playSoundFileNamed("Ding.wav", waitForCompletion: false))
        } else {
            
            ScoreTracker.instance.score -= 1
            run(SKAction.playSoundFileNamed("Buzzer.wav", waitForCompletion: false))
        }
    }
    
    func update(_ context: Context){
        guard let collisionContext = context as? CollisionContext else { return }
        if !collisionContext.nodes.contains(self) { return }
        
        let otherNode = collisionContext.nodes.first(where: {$0 != self})
        collidedWith(object: otherNode!)
    }
}
