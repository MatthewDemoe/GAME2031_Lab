//
//  Item.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-26.
//

import SpriteKit

class Item : SKShapeNode, GameObject, Observer {
    var size: CGFloat = 50
    
    init(gameScene: SKScene) {
        super.init()
        
        CollisionSubject.instance.addObserver(self)
        
        path = SKShapeNode(circleOfRadius: size).path
        
        physicsBody = SKPhysicsBody(circleOfRadius: size * 0.75)
        
        let speedReduction = Double.random(in: 0.0 ... 1.0)
        
        physicsBody?.linearDamping = speedReduction
        physicsBody?.friction = speedReduction
        physicsBody?.contactTestBitMask = physicsBody!.collisionBitMask
        
        let width = gameScene.bounds.maxX - bounds.maxX
        
        let randomWidth = Double.random(in: -width ... width)
        
        let startPosition = CGPoint(x: randomWidth, y: gameScene.bounds.maxY + bounds.maxY)
        position = startPosition
        
        gameScene.addChild(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collidedWith(object: SKNode){
        if object is Player{
            
            CollisionSubject.instance.removeObserver(self)
            self.removeFromParent()
        }
    }
    
    func update(_ context: Context){
        guard let collisionContext = context as? CollisionContext else { return }
        if !collisionContext.nodes.contains(self) { return }
        
        let otherNode = collisionContext.nodes.first(where: {$0 != self})
        collidedWith(object: otherNode!)
    }
}
