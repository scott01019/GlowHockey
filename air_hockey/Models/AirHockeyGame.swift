//
//  AirHockeyGame.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit

class AirHockeyGame {
    var playerScore : UInt32 = 0
    var opponentScore : UInt32 = 0
    
    var winScore : UInt32
    
    var playerPosition : CGPoint
    var playerVelocity : CGVector
    
    var opponentPosition : CGPoint
    var opponentVelocity : CGVector
    
    var puckPosition : CGPoint
    var puckVelocity : CGVector
    
    init() {
        self.winScore = 7
        
        self.playerPosition = CGPoint()
        self.playerVelocity = CGVector()
        
        self.opponentPosition = CGPoint()
        self.opponentVelocity = CGVector()
        
        self.puckPosition = CGPoint()
        self.puckVelocity = CGVector()
    }
    
    init(playerPos: CGPoint, playerVelocity: CGVector, opponentPos: CGPoint, opponentVelocity: CGVector, puckPos: CGPoint, puckVelocity: CGVector, winScore: UInt32 = 7) {
        self.winScore = winScore
        
        self.playerPosition = playerPos
        self.playerVelocity = playerVelocity
        
        self.opponentPosition = opponentPos
        self.opponentVelocity = opponentVelocity
        
        self.puckPosition = puckPos
        self.puckVelocity = puckVelocity
    }
    
    func updateState(playerPos: CGPoint, playerVelocity: CGVector, opponentPos: CGPoint, opponentVelocity: CGVector, puckPos: CGPoint, puckVelocity: CGVector) {
        self.playerPosition = playerPos
        self.playerVelocity = playerVelocity
        
        self.opponentPosition = opponentPos
        self.opponentVelocity = opponentVelocity
        
        self.puckPosition = puckPos
        self.puckVelocity = puckVelocity
    }
    
    func playerScored() {
        self.playerScore += 1
    }
    
    func opponentScored() {
        self.opponentScore += 1
    }
    
    func gameOver() -> Bool {
        return playerScore >= winScore || opponentScore >= winScore
    }
    
    func winner() -> String? {
        return gameOver() ? ((playerScore >= winScore) ? "Player" : "Opponent") : nil
    }
    
    func reset() {
        self.winScore = 7
        
        self.playerScore = 0
        self.opponentScore = 0
        
        self.playerPosition = PLAYER.pos
        self.playerVelocity = CGVector()
        
        self.opponentPosition = OPPONENT.pos
        self.opponentVelocity = CGVector()
        
        self.puckPosition = PUCK.initPos
        self.puckVelocity = CGVector()
    }
}
