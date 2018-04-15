//
//  AHOverlay.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/29/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHOverlay : SKShapeNode {
    init(rect: CGRect) {
        super.init()
        self.path = CGPath(rect: rect, transform: nil)
        self.fillColor = OVERLAY_COLOR
        self.strokeColor = OVERLAY_COLOR
        self.zPosition = MENU_Z
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
