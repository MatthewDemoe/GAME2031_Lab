//
//  Player.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-18.
//
import SpriteKit

class Player : SKShapeNode {
    private var moveSpeed: CGFloat = 0.5
    private var size: CGFloat = 100

    init(rootNode: SKScene) {
        super.init()
        
        //path is the lines making up the shape node
        path = SKShapeNode(circleOfRadius: size).path
        strokeColor =  SKColor.black
        fillColor = SKColor.white
        
        rootNode.addChild(self)
    }
    
    func move(location: CGPoint){
        run(SKAction.move(to: location, duration: moveSpeed))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
