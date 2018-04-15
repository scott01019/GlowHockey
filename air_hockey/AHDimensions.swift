//
//  AHDimensions.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/27/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import UIKit
import SpriteKit

class AHDimensions {
    static let WIDTH : CGFloat = UIScreen.main.bounds.size.width
    static let HEIGHT : CGFloat = UIScreen.main.bounds.size.height
    static let PADDING : CGFloat = WIDTH > HEIGHT ? HEIGHT * 0.05 : WIDTH * 0.05
    
    
    
    static let HORIZONTAL_BAR : CGSize = CGSize(width: (WIDTH - 2.0 * PADDING) /  3.0, height: (HEIGHT - 2.0 * PADDING) * 0.01)
    static let VERTICAL_BAR : CGSize = CGSize(width: (WIDTH - 2.0 * PADDING) * 0.02, height: (HEIGHT - 3.0 * PADDING - 2.0 * HORIZONTAL_BAR.height))
    static let ARC_OFFSET : CGFloat = 10.0

    static let BARRIERS : [CGRect] = [
        CGRect(
            x: -WIDTH / 2.0 + PADDING,
            y: HEIGHT / 2.0 - PADDING - HORIZONTAL_BAR.height,
            width: HORIZONTAL_BAR.width,
            height: HORIZONTAL_BAR.height
        ),
        CGRect(
            x: -WIDTH / 2.0 + PADDING + HORIZONTAL_BAR.width * 2.0,
            y: HEIGHT / 2.0 - PADDING - HORIZONTAL_BAR.height,
            width: HORIZONTAL_BAR.width,
            height: HORIZONTAL_BAR.height
        ),
        CGRect(
            x: -WIDTH / 2.0 + PADDING + HORIZONTAL_BAR.width * 2.0,
            y: -HEIGHT / 2.0 + PADDING,
            width: HORIZONTAL_BAR.width,
            height: HORIZONTAL_BAR.height
        ),
        CGRect(
            x: -WIDTH / 2.0 + PADDING,
            y: -HEIGHT / 2.0 + PADDING,
            width: HORIZONTAL_BAR.width,
            height: HORIZONTAL_BAR.height
        ),
        CGRect(
            x: -WIDTH / 2.0 + PADDING,
            y: -HEIGHT / 2.0 + 1.5 * PADDING + HORIZONTAL_BAR.height,
            width: VERTICAL_BAR.width,
            height: VERTICAL_BAR.height
        ),
        CGRect(
            x:  WIDTH / 2.0 - PADDING - VERTICAL_BAR.width,
            y: -HEIGHT / 2.0 + 1.5 * PADDING + HORIZONTAL_BAR.height,
            width: VERTICAL_BAR.width,
            height: VERTICAL_BAR.height
        )
    ]
    
    static let SHAPE_LINEWIDTH : CGFloat = 1.0
    
    static let STATIC_SHAPES : [CGPath] = [
        { () -> CGPath in
            let path = CGMutablePath()
            path.addArc(
                center: CGPoint(x: 0.0, y: HEIGHT / 2.0 - PADDING - HORIZONTAL_BAR.height),
                radius: HORIZONTAL_BAR.width / 2.0 + ARC_OFFSET,
                startAngle: 0.0,
                endAngle: CGFloat.pi,
                clockwise: true
            )
            return path
        }(),
        { () -> CGPath in
            let path = CGMutablePath()
            path.addArc(
                center: CGPoint(x: 0.0, y: HEIGHT / 2.0 - PADDING - HORIZONTAL_BAR.height),
                radius: HORIZONTAL_BAR.width / 2.0,
                startAngle: 0.0,
                endAngle: CGFloat.pi,
                clockwise: true
            )
            return path
        }(),
        { () -> CGPath in
            let path = CGMutablePath()
            path.addArc(
                center: CGPoint(x: 0.0, y: -HEIGHT / 2.0 + PADDING + HORIZONTAL_BAR.height),
                radius: HORIZONTAL_BAR.width / 2.0 + ARC_OFFSET,
                startAngle: 0.0,
                endAngle: CGFloat.pi,
                clockwise: false
            )
            return path
        }(),
        { () -> CGPath in
            let path = CGMutablePath()
            path.addArc(
                center: CGPoint(x: 0.0, y: -HEIGHT / 2.0 + PADDING + HORIZONTAL_BAR.height),
                radius: HORIZONTAL_BAR.width / 2.0,
                startAngle: 0.0,
                endAngle: CGFloat.pi,
                clockwise: false
            )
            return path
        }(),
        { () -> CGPath in
            let path = CGMutablePath()
            path.addLines(between: [
                CGPoint(x: -WIDTH / 2.0 + PADDING + VERTICAL_BAR.width, y: ARC_OFFSET / 2.0),
                CGPoint(x: WIDTH / 2.0 - PADDING - VERTICAL_BAR.width, y: ARC_OFFSET / 2.0)
            ])
            return path
        }(),
        { () -> CGPath in
            let path = CGMutablePath()
            path.addLines(between: [
                CGPoint(x: -WIDTH / 2.0 + PADDING + VERTICAL_BAR.width, y: -ARC_OFFSET / 2.0),
                CGPoint(x: WIDTH / 2.0 - PADDING - VERTICAL_BAR.width, y: -ARC_OFFSET / 2.0)
            ])
            return path
        }(),
        { () -> CGPath in
            let path = CGMutablePath()
            path.addArc(
                center: CGPoint(x: 0.0, y: 0.0),
                radius: HORIZONTAL_BAR.width / 2.0,
                startAngle: 0.0,
                endAngle: CGFloat.pi * 2.0,
                clockwise: true
            )
            return path
        }(),
        { () -> CGPath in
            let path = CGMutablePath()
            path.addArc(
                center: CGPoint(x: 0.0, y: 0.0),
                radius: HORIZONTAL_BAR.width / 2.0 - ARC_OFFSET,
                startAngle: 0.0,
                endAngle: CGFloat.pi * 2.0,
                clockwise: true
            )
            return path
        }()
    ]
    
    static let EXTRA_LARGE_GLOW_WIDTH = PADDING
    static let LARGE_GLOW_WIDTH = PADDING / 1.5
    static let MEDIUM_GLOW_WIDTH = PADDING / 2.0
    static let SMALL_GLOW_WIDTH = PADDING / 3.0
    static let EXTRA_SMALL_GLOW_WIDTH = PADDING / 6.0
    
    static let MIDDLE_LINE : [CGPoint] = [
        CGPoint(x: -WIDTH + PADDING + VERTICAL_BAR.width, y: 0.0),
        CGPoint(x: WIDTH - PADDING - VERTICAL_BAR.width, y: 0.0)
    ]
        
    static let HANDLE_RADIUS : CGFloat = HORIZONTAL_BAR.width / 5.0
    static let HANDLE_LINEWIDTH : CGFloat = HORIZONTAL_BAR.width / 10.0
    
    static let PLAYER : Player = Player()
    static let OPPONENT : Opponent = Opponent()
    static let PUCK : Puck = Puck()
    
    struct Player {
        let pos : CGPoint = CGPoint(x: 0.0, y: -HEIGHT / 4.0)
        let constraints : [SKConstraint] = [
            SKConstraint.positionX(
                SKRange(lowerLimit: -WIDTH / 2.0 + PADDING + VERTICAL_BAR.width, upperLimit: WIDTH / 2.0 - PADDING - VERTICAL_BAR.width)
            ),
            SKConstraint.positionY(SKRange(lowerLimit: -HEIGHT / 2.0 + PADDING + HORIZONTAL_BAR.height, upperLimit: 0.0))
        ]
        let minX : CGFloat = -WIDTH / 2.0 + PADDING + VERTICAL_BAR.width
        let minY : CGFloat = -HEIGHT / 2.0 + PADDING + HORIZONTAL_BAR.height
        let maxX : CGFloat = WIDTH / 2.0 - PADDING - VERTICAL_BAR.width
        let maxY : CGFloat = 0.0
    }
    
    struct Opponent {
        let pos : CGPoint = CGPoint(x: 0.0, y: HEIGHT / 4.0)
        let constraints : [SKConstraint] = [
            SKConstraint.positionX(
                SKRange(lowerLimit: -WIDTH / 2.0 + PADDING + VERTICAL_BAR.width, upperLimit: WIDTH / 2.0 - PADDING - VERTICAL_BAR.width)
            ),
            SKConstraint.positionY(SKRange(lowerLimit: 0.0, upperLimit: HEIGHT / 2.0 - PADDING - HORIZONTAL_BAR.height))
        ]
        let minX : CGFloat = -WIDTH / 2.0 + PADDING + VERTICAL_BAR.width
        let minY : CGFloat = 0.0
        let maxX : CGFloat = WIDTH / 2.0 - PADDING - VERTICAL_BAR.width
        let maxY : CGFloat = HEIGHT / 2.0 - PADDING - HORIZONTAL_BAR.height
    }
    
    struct Puck {
        let initPos : CGPoint = CGPoint(x: 0.0, y: 0.0)
        let playerPos : CGPoint = CGPoint(x: 0.0, y: -HORIZONTAL_BAR.width / 2.0)
        let oppPos : CGPoint = CGPoint(x: 0.0, y: HORIZONTAL_BAR.width / 2.0)
        let radius : CGFloat = HORIZONTAL_BAR.width / 5.0
        let innerRadius : CGFloat = HORIZONTAL_BAR.width / 6.0
    }
}
