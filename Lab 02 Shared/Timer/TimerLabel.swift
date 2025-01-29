//
//  TimerLabel.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-20.
//
import SpriteKit

class TimerLabel : Observer {
    var timerLabel: SKLabelNode
    
    init(rootNode: SKScene) {
        self.timerLabel = SKLabelNode()
        self.timerLabel = SKLabelNode.init(text: "Remaining Time: ...")
        self.timerLabel.fontSize = 80
        
        self.timerLabel.position.y =  rootNode.bounds.maxY - timerLabel.bounds.height
        self.timerLabel.position.x = rootNode.bounds.minX + timerLabel.bounds.maxX + 100
        
        rootNode.addChild(timerLabel)
    }
    
    func update(_ context: Context){
        if let timerContext = context as? TimerContext{
            timerLabel.text = String(format: "Remaining Time %.1f", timerContext.remainingTime)
        }
    }
}
