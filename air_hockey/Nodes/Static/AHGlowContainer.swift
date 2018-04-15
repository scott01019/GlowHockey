//
//  AHContainer.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/29/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHGlowContainer : SKShapeNode {
    var glowContainer : SKShapeNode
    
    init(rect: CGRect) {
        self.glowContainer = SKShapeNode(rect: rect)
        
        super.init()
        
        self.path = CGPath(rect: rect, transform: nil)
        self.fillColor = .clear
        self.lineWidth = MENU_LINEWIDTH
        self.strokeColor = .blue
        self.zPosition = MENU_Z
        self.glowWidth = SMALL_GLOW_WIDTH
        self.blendMode = .alpha
        
        self.glowContainer.fillColor = .clear
        self.glowContainer.lineWidth = MENU_LINEWIDTH / 2.0
        self.glowContainer.strokeColor = .white
        self.glowContainer.zPosition = MENU_Z
        self.glowContainer.glowWidth = EXTRA_SMALL_GLOW_WIDTH
        self.glowContainer.blendMode = .alpha
        
        self.addChild(self.glowContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
