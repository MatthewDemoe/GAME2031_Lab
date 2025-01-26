//
//  GameTimeContext.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-19.
//
import SpriteKit

enum GameState{
    case play
    case pause
    case gameOver
}

class GameStateContext : Context{
    var gameState: GameState
    
    init(gameState: GameState) {
        self.gameState = gameState
    }
}
