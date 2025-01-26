//
//  LevelTimer.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-18.
//
import SpriteKit

class LevelTimer : Subject {
    var levelTime: Double
    var remainingTime: Double
    var isComplete = false
    var view: SKView
    
    init(levelTime: Double, rootNode: SKNode) {
        self.levelTime = levelTime
        self.remainingTime = levelTime
        
        self.view = (rootNode.scene?.view)!
    }
    
    func update(deltaTime: Double){
        if(isComplete){
            return
        }
        
        remainingTime -= deltaTime
        notifyObservers(TimerContext(remainingTime: remainingTime))

        if(remainingTime <= 0){
            isComplete = true
            notifyObservers(GameStateContext(gameState: GameState.gameOver))
        }
    }
    
    func setPaused(_ state: Bool){
        if(view.isPaused == state){
            return
        }
        
        view.isPaused = state
        
        if(view.isPaused){
            notifyObservers(GameStateContext(gameState: GameState.pause))
        }else{
            notifyObservers(GameStateContext(gameState: GameState.play))
        }
    }
}
