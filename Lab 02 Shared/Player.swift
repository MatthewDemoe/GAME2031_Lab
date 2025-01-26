//
//  Player.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-18.
//
import SpriteKit

class Player {
    private var moveSpeed: CGFloat = 0.5
    private let playerShape: SKShapeNode = SKShapeNode.init(circleOfRadius: 50)
    
    
    init(rootNode: SKNode) {
        rootNode.addChild(playerShape)
    }
    
    func move(location: CGPoint){
        playerShape.run(SKAction.move(to: location, duration: moveSpeed))
    }
}
