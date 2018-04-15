//
//  AHGlowHandle.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHGlowHandle : AHHandle {
    init(pos: CGPoint, constraints: [SKConstraint], color: UIColor) {
        super.init(pos: pos, constraints: constraints)
        self.fillColor = .clear
        self.strokeColor = color
        self.glowWidth = MEDIUM_GLOW_WIDTH
        self.blendMode = .add
        
        let circle = SKShapeNode(circleOfRadius: HANDLE_RADIUS)
        circle.position = CGPoint(x: 0, y: 0.0)
        circle.fillColor = .clear
        circle.lineWidth = HANDLE_LINEWIDTH / 2.0
        circle.strokeColor = UIColor.white
        circle.glowWidth = EXTRA_SMALL_GLOW_WIDTH
        
        self.addChild(circle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
