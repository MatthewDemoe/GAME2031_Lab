//
//  GameTimeObserver.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-19.
//
import SpriteKit

class GameStateObserver : Observer {
    var view : SKView
    
    init(view: SKView) {
        self.view = view
    }
    
    func update(_ context: Context){
        if let stateContext = context as? GameStateContext{
            if stateContext.gameState == GameState.gameOver{
                let scene = GameOverScene.newGameScene()
                scene.scaleMode = SKSceneScaleMode.aspectFill
                
                view.presentScene(scene)
            }
        }
    }
}
