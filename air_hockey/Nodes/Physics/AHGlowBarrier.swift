//
//  AHGlowSB.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit
class AHGlowBarrier : AHBarrier {
    init(rect: CGRect, color: UIColor) {
        super.init(rect: rect)
        self.strokeColor = color
        self.fillColor = color
        self.glowWidth = MEDIUM_GLOW_WIDTH
        self.blendMode = .add
        
        let child = SKShapeNode(rect: rect)
        child.strokeColor = .white
        child.fillColor = .white
        child.glowWidth = EXTRA_SMALL_GLOW_WIDTH
        
        self.addChild(child)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
