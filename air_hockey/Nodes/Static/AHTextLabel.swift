//
//  AHTextLabel.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit
import UIKit

class AHTextLabel : SKLabelNode {
    init(pos: CGPoint, text: String) {
        super.init()
        self.text = text
        self.numberOfLines = 1
        self.fontColor = .white
        self.position = pos
        self.fontSize = TABLE_TEXT_SIZE
        self.fontName = "HelveticaNeue-Bold"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
