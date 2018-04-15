//
//  AHFactory.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//


import SpriteKit

class AHFactory {
    
    static func createArc(path: CGMutablePath, color: UIColor, glow: Bool) -> SKShapeNode {
        let arc = SKShapeNode(path: path)
        arc.fillColor = .clear
        arc.strokeColor = color
        arc.lineWidth = 1.0
        if glow {
            arc.glowWidth = EXTRA_SMALL_GLOW_WIDTH
        }        
        return arc
    }
}
