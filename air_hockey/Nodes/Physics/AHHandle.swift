//
//  AHHandle.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHHandle : SKShapeNode {
    init(pos: CGPoint, constraints: [SKConstraint]) {
        super.init()
        
        self.position = pos
        
        let path = CGMutablePath()
        path.addArc(center: CGPoint(x: 0.0, y: 0.0), radius: HANDLE_RADIUS, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
        self.path = path
        
        self.fillColor = .clear
        self.lineWidth = HANDLE_LINEWIDTH
        self.constraints = constraints
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: HANDLE_RADIUS)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.restitution = 0.0
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.categoryBitMask = HANDLE_CATEGORY_MASK
        self.physicsBody?.contactTestBitMask = PUCK_CATEGORY_MASK | BARRIER_CATEGORY_MASK | HANDLE_CATEGORY_MASK | INVISIBLE_BARRIER_CATEGORY_MASK
        self.physicsBody?.collisionBitMask = PUCK_CATEGORY_MASK | BARRIER_CATEGORY_MASK | HANDLE_CATEGORY_MASK | INVISIBLE_BARRIER_CATEGORY_MASK
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
