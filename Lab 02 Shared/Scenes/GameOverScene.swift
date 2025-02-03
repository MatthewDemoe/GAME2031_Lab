//
//  GameOverScene.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-20.
//
import SpriteKit

class GameOverScene : SKScene {
    
    class func newGameScene() -> GameOverScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GameOverScene") as? GameOverScene else {
            print("Failed to load GameOverScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        return scene
    }
    
    override func didMove(to view: SKView) {
        self.setUpScene()
    }
    
    func setUpScene(){
        let node = self.childNode(withName: "//GameOverLabel")
        
        guard let label = node as? SKLabelNode else { return }
        label.numberOfLines = 0
        //label.text = "Game Over! :( \nFinal Score: \(ScoreTracker.instance.score)"
    }
}
