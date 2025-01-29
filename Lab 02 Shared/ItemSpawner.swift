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
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            _ in
            self.spawnItem()
        }
    }
    
    func stop(){
        timer?.invalidate()
    }
    
    func spawnItem(){
        let rand = Int.random(in: 0...1)
        
        var spawnedItem: Item
        
        if(rand > 0){
            spawnedItem = Collectable(gameScene: gameScene)
        }else{
            spawnedItem = Obstacle(gameScene: gameScene)
        }
    }
}
