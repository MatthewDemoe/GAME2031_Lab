//
//  TimerLabel.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-20.
//
import SpriteKit

class TimerLabel : Observer{
    var timerLabel: SKLabelNode
    var view: SKView
    
    init(rootNode: SKNode) {
        self.timerLabel = SKLabelNode()
        self.timerLabel = SKLabelNode.init(text: "Remaining Time: ...")
        self.timerLabel.position.y = (UIScreen.main.bounds.height) * 0.5
        self.timerLabel.fontSize = 80
        
        rootNode.addChild(timerLabel)
        
        self.view = (rootNode.scene?.view)!
    }
    
    func update(_ context: Context){
        if let timerContext = context as? TimerContext{
            timerLabel.text = "Remaining Time: \(Int(timerContext.remainingTime))" //String(format: "Remaining Time %.1f", remainingTime)//
        }
    }
}
