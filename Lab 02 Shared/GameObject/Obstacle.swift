//
//  Obstacle.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-26.
//

import SpriteKit

class Obstacle : Item {
    
    override init(gameScene: SKScene) {
        super.init(gameScene: gameScene)
        
        strokeColor = SKColor.black
        fillColor = SKColor.red
    }
    
    @MainActor required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collidedWith(object: SKNode){
        super.collidedWith(object: object)
    }
}
