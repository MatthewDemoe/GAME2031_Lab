//
//  Player.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-18.
//

import SpriteKit

class Player : SKShapeNode, Observer {
    private var score: Int = 0
    private let size: CGFloat = 100
    private var moveSpeed: CGFloat = 700.0
    
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
        
        CollisionSubject.instance.addObserver(self)
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
        if object is Collectable {
            
            score += 1
            print("Score: \(score)")
            run(SKAction.playSoundFileNamed("Ding.wav", waitForCompletion: false))
        }
    }
    
    func update(_ context: Context){
        print("Player collided")
        
        guard let collisionContext = context as? CollisionContext else { return }
        if !collisionContext.nodes.contains(self) { return }
        
        let otherNode = collisionContext.nodes.first(where: {$0 != self})
        collidedWith(object: otherNode!)
    }
}
