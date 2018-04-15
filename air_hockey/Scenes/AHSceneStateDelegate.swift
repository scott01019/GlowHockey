//
//  AHSceneDelegate.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/29/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

protocol AHSceneStateDelegate : class {
    var scene : AHGameScene { get set }
    func startSceneState()
    func endSceneState()
    func touchDown(atPoint pos : CGPoint)
    func touchMoved(toPoint pos : CGPoint)
    func touchUp(atPoint pos : CGPoint)
    func update(_ currentTime: TimeInterval)
}
