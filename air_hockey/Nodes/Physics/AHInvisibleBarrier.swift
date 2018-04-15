//
//  AHInvisibleBarrier.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHInvisibleBarrier : AHBarrier {
    override init(rect: CGRect) {
        super.init(rect: rect)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.restitution = 0.0
        self.physicsBody?.categoryBitMask = INVISIBLE_BARRIER_CATEGORY_MASK
        self.physicsBody?.collisionBitMask = HANDLE_CATEGORY_MASK
        self.physicsBody?.contactTestBitMask = HANDLE_CATEGORY_MASK
        self.strokeColor = .clear
        self.fillColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
