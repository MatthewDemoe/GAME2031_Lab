//
//  ItemSpawner.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-26.
//

import SpriteKit

class ItemSpawner {
    
    var gameScene: SKScene
    var timer: Timer?
    
    init(gameScene: SKScene) {
        self.gameScene = gameScene
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true){
            _ in
            self.spawnItem()
        }
    }
    
    func stop(){
        timer?.invalidate()
    }
    
    func spawnItem(){
        let startX = Double.random(in: gameScene.frame.minX ... gameScene.frame.maxX)
        
        let spawnedItem = Collectable(gameScene: gameScene)
        spawnedItem.position = CGPoint(x: startX, y: gameScene.frame.maxY + spawnedItem.frame.maxY)

    }
}
