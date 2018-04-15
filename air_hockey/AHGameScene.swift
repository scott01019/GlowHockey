//
//  GameScene.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/26/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit
import Dispatch

enum GameSceneState {
    case StartMenu
    case PauseMenu
    case Playing
    case GoalScored
    static var current = GameSceneState.StartMenu
}

class AHGameScene: SKScene {
    var activeDelegate : AHSceneStateDelegate?
    
    var gameWorld : AHGameWorld = AHGameWorld()
    var startGameMenu : AHGameMenu = AHGameMenu(buttons: START_MENU_BUTTONS, containerRect: MENU_RECT)
    var airHockeyGame : AirHockeyGame = AirHockeyGame()
    var AIPlaying : Bool = false
    
    var playingDelegate : AHSceneStateDelegate?
    var goalScoredDelegate : AHSceneStateDelegate?
    var startMenuDelegate : AHSceneStateDelegate?
    var pauseMenuDelegate : AHSceneStateDelegate?
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.backgroundColor = .black
        
        self.addChild(self.gameWorld)
        self.addChild(self.startGameMenu)
        
        self.airHockeyGame = AirHockeyGame(
            playerPos: self.gameWorld.player.position,
            playerVelocity: (self.gameWorld.player.physicsBody?.velocity)!,
            opponentPos: self.gameWorld.opponent.position,
            opponentVelocity: (self.gameWorld.opponent.physicsBody?.velocity)!,
            puckPos: self.gameWorld.puck.position,
            puckVelocity: (self.gameWorld.puck.physicsBody?.velocity)!
        )
        
        self.playingDelegate = AHScenePlayingDelegate(scene: self)
        self.startMenuDelegate = AHSceneStartMenuDelegate(scene: self)
        self.activeDelegate = self.startMenuDelegate
        
        self.physicsWorld.contactDelegate = self.gameWorld
    }
    
    override func didMove(to view: SKView) {
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        self.activeDelegate?.touchDown(atPoint: pos)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        self.activeDelegate?.touchMoved(toPoint: pos)
    }
    
    func touchUp(atPoint pos : CGPoint) {
        self.activeDelegate?.touchUp(atPoint: pos)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches { self.touchDown(atPoint: touch.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches { self.touchMoved(toPoint: touch.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches { self.touchUp(atPoint: touch.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.activeDelegate?.update(currentTime)
    }

    func changeState(next: GameSceneState) {
        self.activeDelegate?.endSceneState()

        if next == .StartMenu {
            self.activeDelegate = self.startMenuDelegate
        } else if next == .Playing {
            self.activeDelegate = self.playingDelegate
        } else if next == .GoalScored {
            self.activeDelegate = self.goalScoredDelegate
        } else if next == .PauseMenu {
            self.activeDelegate = self.pauseMenuDelegate
        }
        
        self.activeDelegate?.startSceneState()
    }
}

//extension GameScene : SKPhysicsContactDelegate {
//    func didBegin(_ contact: SKPhysicsContact) {
//        let node = SKShapeNode(circleOfRadius: 10.0)
//        node.position = contact.contactPoint
//        node.strokeColor = .red
//        node.lineWidth = 0.33
//        node.fillColor = .clear
//        node.blendMode = .alpha
//        self.addChild(node)
//        node.run(SKAction.scale(to: 3.0, duration: 0.3)) {
//            self.removeChildren(in: [node])
//        }
//    }
//}

