//
//  AHGameWorld.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/29/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//
import Foundation
import Dispatch
import SpriteKit

class AHGameWorld : SKNode {
    var glowDispatchGroup : DispatchGroup = DispatchGroup()
    
    var playerDestination : CGPoint
    var player : SKNode
    var opponentDestination : CGPoint
    var opponent : SKNode
    var puck : SKNode
    
    var twoPlayer : Bool = false
    
    var playerScoreLabel : AHTextLabel
    var opponentScoreLabel : AHTextLabel
    
    override init() {
        self.playerDestination = PLAYER.pos
        self.player = AHGlowHandle(pos: self.playerDestination, constraints: PLAYER.constraints, color: .green)
        
        self.opponentDestination = OPPONENT.pos
        self.opponent = AHGlowHandle(pos: OPPONENT.pos, constraints: OPPONENT.constraints, color: .yellow)
        
        self.puck = AHGlowPuck(pos: PUCK.initPos, color: .blue)
        
        self.opponentScoreLabel = AHTextLabel(pos: TABLE_TEXT[0], text: "0")
        self.playerScoreLabel = AHTextLabel(pos: TABLE_TEXT[1], text: "0")

        super.init()

        self.playerScoreLabel.zRotation = .pi / 2.0
        self.opponentScoreLabel.zRotation = .pi / 2.0
        
        for bar in INVISIBLE_BARRIERS {
            self.addChild(AHInvisibleBarrier(rect: bar))
        }
        
        for path in STATIC_SHAPES {
            let node = SKShapeNode(path: path)
            node.lineWidth = SHAPE_LINEWIDTH
            node.strokeColor = WHITE_ALPHA
            node.glowWidth = EXTRA_SMALL_GLOW_WIDTH
            self.addChild(node)
        }
        
        for bar in GLOW_BARRIERS {
            self.addChild(AHGlowBarrier(rect: bar, color: .red))
        }
        
        self.addChild(self.player)
        self.addChild(self.opponent)
        self.addChild(puck)
        self.addChild(opponentScoreLabel)
        self.addChild(playerScoreLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initTable() {
        self.puck.position = PUCK.initPos
        self.puck.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
        self.playerDestination = PLAYER.pos
        self.player.position = PLAYER.pos
        self.player.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
        self.opponent.position = OPPONENT.pos
        self.opponent.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
    }
    
    func updatePlayerPosition() {
        let dx = self.playerDestination.x - self.player.position.x
        let dy = self.playerDestination.y - self.player.position.y
        if dx != 0 || dy != 0 {
            self.player.physicsBody?.velocity = CGVector(dx: 10.0 * dx, dy: 10.0 * dy)
        } else {
            self.player.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
        }
    }
    
    func updatePlayerTwoPosition() {
        let dx = self.opponentDestination.x - self.opponent.position.x
        let dy = self.opponentDestination.y - self.opponent.position.y
        if dx != 0 || dy != 0 {
            self.opponent.physicsBody?.velocity = CGVector(dx: 10.0 * dx, dy: 10.0 * dy)
        } else {
            self.opponent.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
        }
    }
    
    func updateAIOpponentPosition() {
        if self.puck.position.y >= 0.0 && !(self.puck.position.y >= self.opponent.position.y) {
            let dx = self.puck.position.x - self.opponent.position.x
            let dy = self.puck.position.y - self.opponent.position.y
            if dx != 0 || dy != 0 {
                self.opponent.physicsBody?.velocity = CGVector(dx: 5.0 * dx, dy: 5.0 * dy)
            } else {
                self.opponent.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
            }
        } else {
            let dest = CGPoint(x: 0.0, y: HEIGHT / 2.0 - HORIZONTAL_BAR.width / 2.0)
            let dy = dest.y - self.opponent.position.y
            let dx = dest.x - self.opponent.position.x
            if dx != 0 || dy != 0 {
                
                self.opponent.physicsBody?.velocity = CGVector(dx: 5.0 * dx, dy: 5.0 * dy)
            } else {
                self.opponent.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
            }
        }
        
    }
    
    func updatePuck() {        
        if (puck.physicsBody?.velocity.dx)! <= CGFloat(0.0) && (puck.physicsBody?.velocity.dx)! > CGFloat(-20.0) {
            puck.physicsBody?.velocity.dx = -20.0
        }
        if (puck.physicsBody?.velocity.dx)! >= CGFloat(0.0) && (puck.physicsBody?.velocity.dx)! < CGFloat(20.0) {
            puck.physicsBody?.velocity.dx = 20.0
        }
        if (puck.physicsBody?.velocity.dy)! <= CGFloat(0.0) && (puck.physicsBody?.velocity.dy)! > CGFloat(-20.0) {
            puck.physicsBody?.velocity.dy = -20.0
        }
        if (puck.physicsBody?.velocity.dy)! >= CGFloat(0.0) && (puck.physicsBody?.velocity.dy)! < CGFloat(20.0) {
            puck.physicsBody?.velocity.dy = 20.0
        }
    }
    
    func playerScored() -> Bool {
        return self.puck.position.y > OPPONENT_SIDE_SCORING_REGION
    }
    
    func opponentScored() -> Bool {
        return self.puck.position.y < PLAYER_SIDE_SCORING_REGION
    }
}

extension AHGameWorld : SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.node?.physicsBody?.categoryBitMask)! & (BARRIER_CATEGORY_MASK | PUCK_CATEGORY_MASK) > 0
            && (contact.bodyB.node?.physicsBody?.categoryBitMask)! & (BARRIER_CATEGORY_MASK | PUCK_CATEGORY_MASK) > 0 {
            self.barrierPuckContact(pos: contact.contactPoint)
        }
        
        if (contact.bodyA.node?.physicsBody?.categoryBitMask)! & (BARRIER_CATEGORY_MASK | HANDLE_CATEGORY_MASK) > 0
            && (contact.bodyB.node?.physicsBody?.categoryBitMask)! & (HANDLE_CATEGORY_MASK | BARRIER_CATEGORY_MASK) > 0 {
            barrierHandleContact(nodeA: contact.bodyA.node as! SKShapeNode, nodeB: contact.bodyB.node as! SKShapeNode)
        }
    }
    
    func barrierHandleContact(nodeA: SKShapeNode, nodeB: SKShapeNode) {
        self.glowDispatchGroup.enter()
        DispatchQueue.global().async {
            nodeA.glowWidth = EXTRA_LARGE_GLOW_WIDTH
            nodeB.glowWidth = EXTRA_LARGE_GLOW_WIDTH
        }

        DispatchQueue.global().asyncAfter(deadline: .now() + 0.05, execute: {
            self.glowDispatchGroup.leave()
        })
        
        self.glowDispatchGroup.notify(queue: DispatchQueue.global(), execute: {
            nodeA.glowWidth = MEDIUM_GLOW_WIDTH
            nodeB.glowWidth = MEDIUM_GLOW_WIDTH
        })
    }
    
    func barrierPuckContact(pos: CGPoint) {
        
        let node = SKShapeNode(circleOfRadius: 10.0)
        node.position = pos
        node.strokeColor = .red
        node.lineWidth = 4.0
        node.glowWidth = 0.6
        node.fillColor = .clear
        node.blendMode = .add
        
        let innerNode = SKShapeNode(circleOfRadius: 10.0)
        innerNode.strokeColor = .white
        innerNode.lineWidth = 2.0
        innerNode.glowWidth = 0.3
        innerNode.fillColor = .clear
        innerNode.blendMode = .alpha
        
        node.addChild(innerNode)
        self.addChild(node)

        node.run(SKAction.scale(to: CGFloat(2.0 + Float(arc4random()) / 0xFFFFFFFF * (4.0 - 2.0)), duration: 0.3)) {
            self.removeChildren(in: [node])
        }
    }
}
