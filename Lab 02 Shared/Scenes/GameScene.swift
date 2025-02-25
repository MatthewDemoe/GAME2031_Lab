//
//  GameScene.swift
//  Lab 02 Shared
//
//  Created by Kaela  Murphy  on 2025-01-10.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    class func newGameScene() -> GameScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        return scene
    }
    
    let subject = Subject()
    var player: Player?
    var previousTime: Double = 0.0
    var levelTimer: LevelTimer?
    var timerLabel: TimerLabel?
    
    var itemSpawner: ItemSpawner?
    
    func setUpScene() {
        player = Player(rootNode: self)
        
        levelTimer = LevelTimer(levelTime: 30, rootNode: self)
        levelTimer?.addObserver(GameStateObserver(view: self.view!))
        
        timerLabel = TimerLabel(rootNode: self)
        levelTimer?.addObserver(timerLabel!)
        physicsWorld.contactDelegate = self
        
        itemSpawner = ItemSpawner(gameScene: self)
    }
    
    override func didMove(to view: SKView) {
        self.setUpScene()
    }
    
    override func willMove(from view: SKView){
        itemSpawner?.stop()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if(previousTime == 0.0){
            previousTime = currentTime.magnitude
        }
        
        let deltaTime = currentTime - previousTime
        
        levelTimer?.update(deltaTime: deltaTime.magnitude)
        previousTime = currentTime.magnitude
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        guard let touch = touches.first else{
            return
        }
        
        player?.move(location: touch.location(in: self))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        guard let touch = touches.first else{
            return
        }
        
        player?.move(location: touch.location(in: self))
    }
    
    func didBegin(_ contact: SKPhysicsContact){
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        CollisionSubject.instance.notifyObservers(CollisionContext(nodes: [nodeA, nodeB]))
    }
}
