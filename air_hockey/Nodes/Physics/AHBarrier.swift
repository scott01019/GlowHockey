//
//  AHStaticBarrier.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHBarrier : SKShapeNode {
    init(rect: CGRect) {
        super.init()
        self.path = CGPath(rect: rect, transform: nil)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.restitution = 0.5
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.categoryBitMask = BARRIER_CATEGORY_MASK
        self.physicsBody?.contactTestBitMask = HANDLE_CATEGORY_MASK | PUCK_CATEGORY_MASK
        self.physicsBody?.collisionBitMask = HANDLE_CATEGORY_MASK | PUCK_CATEGORY_MASK
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
