//
//  AHScenePlayingDelegate.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/29/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AHScenePlayingDelegate : AHSceneStateDelegate {    
    var scene : AHGameScene
    
    init(scene: AHGameScene) {
        self.scene = scene
    }
    
    func startSceneState() {
        self.scene.gameWorld.isPaused = false
        self.scene.airHockeyGame.reset()
        self.scene.gameWorld.playerScoreLabel.text = String(self.scene.airHockeyGame.playerScore)
        self.scene.gameWorld.opponentScoreLabel.text = String(self.scene.airHockeyGame.opponentScore)
    }
    
    func endSceneState() {
        self.scene.gameWorld.isPaused = true
    }
    
    func touchDown(atPoint pos: CGPoint) {
        if self.scene.gameWorld.twoPlayer {
            if pos.y < 0 {
                self.scene.gameWorld.playerDestination = pos
            } else {
                self.scene.gameWorld.opponentDestination = pos
            }
        } else {
            self.scene.gameWorld.playerDestination = pos
        }
    }
    
    func touchMoved(toPoint pos: CGPoint) {
        if self.scene.gameWorld.twoPlayer {
            if pos.y < 0 {
                self.scene.gameWorld.playerDestination = pos
            } else {
                self.scene.gameWorld.opponentDestination = pos
            }
        } else {
            self.scene.gameWorld.playerDestination = pos
        }
    }
    
    func touchUp(atPoint pos: CGPoint) {
        if self.scene.gameWorld.twoPlayer {
            if pos.y < 0 {
                self.scene.gameWorld.playerDestination = pos
            } else {
                self.scene.gameWorld.opponentDestination = pos
            }
        } else {
            self.scene.gameWorld.playerDestination = pos
        }
    }
    
    func update(_ currentTime: TimeInterval) {
        self.scene.gameWorld.updatePlayerPosition()
        
        if self.scene.gameWorld.twoPlayer {
            self.scene.gameWorld.updatePlayerTwoPosition()
        }
        
        if self.scene.AIPlaying {
            self.scene.gameWorld.updateAIOpponentPosition()
        }
        
        if self.scene.gameWorld.playerScored() {
            self.scene.airHockeyGame.playerScored()
            self.scene.gameWorld.playerScoreLabel.text = String(self.scene.airHockeyGame.playerScore)
            if self.scene.airHockeyGame.gameOver() {
                self.scene.airHockeyGame.reset()
                self.scene.gameWorld.initTable()
                self.scene.changeState(next: .StartMenu)
            } else {
                self.scene.gameWorld.initTable()
                self.scene.gameWorld.puck.position = PUCK.oppPos
            }
        }
        
        if self.scene.gameWorld.opponentScored() {
            self.scene.airHockeyGame.opponentScored()
            self.scene.gameWorld.opponentScoreLabel.text = String(self.scene.airHockeyGame.opponentScore)
            if self.scene.airHockeyGame.gameOver() {
                self.scene.airHockeyGame.reset()
                self.scene.gameWorld.initTable()
                self.scene.changeState(next: .StartMenu)
            } else {
                self.scene.gameWorld.initTable()
                self.scene.gameWorld.puck.position = PUCK.playerPos
            }
        }
    }
}
