//
//  AHMenuButton.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/29/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHMenuButton : AHGlowContainer {
    var buttonLabel : AHTextLabel
    var buttonName : String
    
    init(rect: CGRect, text: String) {
        self.buttonName = text
        self.buttonLabel = AHTextLabel(pos: CGPoint(x: rect.minX + rect.width / 2.0, y: rect.minY + rect.height / 3.0), text: text)
        super.init(rect: rect)
        
        self.addChild(buttonLabel)
        self.buttonLabel.position = CGPoint(x: self.frame.minX + self.frame.width / 2.0, y: self.frame.minY + self.frame.height / 3.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonTouchedDown() {
        self.glowWidth = LARGE_GLOW_WIDTH
    }
    
    func buttonNormal() {
        self.glowWidth = EXTRA_SMALL_GLOW_WIDTH
    }
}
