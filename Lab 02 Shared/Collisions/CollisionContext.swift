//
//  CollisionContext.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-28.
//

import SpriteKit

class CollisionContext : Context {
    let nodes: Set<SKNode>
    
    init(nodes: Set<SKNode>) {
        self.nodes = nodes
    }
}
