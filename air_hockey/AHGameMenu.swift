//
//  AHGameMenu.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/29/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHGameMenu : SKNode {
    var screenOverlay : AHOverlay
    var menuContainer : AHGlowContainer
    var buttons : [AHMenuButton] = [AHMenuButton]()
    var touched : CGPoint = CGPoint(x: WIDTH, y: HEIGHT)

    init(buttons: [(CGRect, String)], containerRect: CGRect) {
        self.screenOverlay = AHOverlay(rect: OVERLAY_RECT)
        self.menuContainer = AHGlowContainer(rect: containerRect)
        
        super.init()
        
        for button in buttons {
            self.buttons.append(AHMenuButton(rect: button.0, text: button.1 ))
            self.menuContainer.addChild(self.buttons.last!)
        }
        
        self.addChild(self.screenOverlay)
        self.addChild(self.menuContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchDown(pos: CGPoint) {
        self.touched = pos
        for button in buttons {
            if button.frame.contains(self.touched) {
                button.buttonTouchedDown()
            } else {
                button.buttonNormal()
            }
        }
    }
    
    func touchUp(pos: CGPoint) -> String? {
        for button in buttons {
            if button.frame.contains(self.touched) && button.frame.contains(pos) {
                return button.buttonName
            } else {
                button.buttonNormal()
            }
        }
        return nil
    }
}
