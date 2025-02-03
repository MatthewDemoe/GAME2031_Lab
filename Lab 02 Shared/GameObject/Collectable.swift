//
//  Collectable.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-26.
//
import SpriteKit

class Collectable : SKShapeNode, Observer {
    var size: CGFloat = 75
    
    init(gameScene: SKScene) {
        super.init()
        
        CollisionSubject.instance.addObserver(self)
        
        path = SKShapeNode(circleOfRadius: size).path
        
        fillColor = SKColor.green
        strokeColor = SKColor.black
        
        physicsBody = SKPhysicsBody(circleOfRadius: size * 0.75)
        
        physicsBody?.contactTestBitMask = physicsBody!.collisionBitMask
        
        gameScene.addChild(self)
    }
    
    @MainActor required init?(coder aDecoder: NSCoder) {
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
