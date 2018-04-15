//
//  AHSceneStartMenuDelegate.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/29/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHSceneStartMenuDelegate : AHSceneStateDelegate {
    var scene: AHGameScene
    
    init(scene: AHGameScene) {
        self.scene = scene
    }
    
    func startSceneState() {
        self.scene.startGameMenu.isHidden = false
        self.scene.startGameMenu.isPaused = false
        for button in self.scene.startGameMenu.buttons {
            button.buttonNormal()
        }
    }
    
    func endSceneState() {
        self.scene.startGameMenu.isHidden = true
        self.scene.startGameMenu.isPaused = true
    }
    
    func touchDown(atPoint pos: CGPoint) {
        self.scene.startGameMenu.touchDown(pos: pos)
    }
    
    func touchMoved(toPoint pos: CGPoint) {

    }
    
    func touchUp(atPoint pos: CGPoint) {
        let result = self.scene.startGameMenu.touchUp(pos: pos)
        if result == "1 Player" {
            self.scene.changeState(next: .Playing)
            self.scene.AIPlaying = true
            self.scene.gameWorld.twoPlayer = false
        } else if result == "2 Player" {
            self.scene.changeState(next: .Playing)
            self.scene.AIPlaying = false
            self.scene.gameWorld.twoPlayer = true
        }
    }
    
    func update(_ currentTime: TimeInterval) {
    }
}
