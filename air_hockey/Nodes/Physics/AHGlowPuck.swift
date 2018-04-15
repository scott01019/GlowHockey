//
//  AHGlowPuck.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHGlowPuck : AHPuck {
    init(pos: CGPoint, color: UIColor) {
        super.init(pos: pos)
        self.fillColor = color
        self.strokeColor = color
        self.glowWidth = SMALL_GLOW_WIDTH
        self.blendMode = .add
        
        let circle = SKShapeNode(circleOfRadius: PUCK.innerRadius)
        circle.position = CGPoint(x: 0, y: 0.0)
        circle.fillColor = UIColor.white
        circle.strokeColor = UIColor.white
        circle.glowWidth = EXTRA_SMALL_GLOW_WIDTH
        
        self.addChild(circle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
