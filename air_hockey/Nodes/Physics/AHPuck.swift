//
//  AHPuck.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHPuck : SKShapeNode {
    init(pos: CGPoint) {
        super.init()
        self.position = pos
        
        let path = CGMutablePath()
        path.addArc(center: CGPoint(x: 0.0, y: 0.0), radius: PUCK.radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
        self.path = path
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: PUCK.radius)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.restitution = 0.5
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.categoryBitMask = PUCK_CATEGORY_MASK
        self.physicsBody?.contactTestBitMask = HANDLE_CATEGORY_MASK | BARRIER_CATEGORY_MASK
        self.physicsBody?.collisionBitMask = HANDLE_CATEGORY_MASK | BARRIER_CATEGORY_MASK
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
