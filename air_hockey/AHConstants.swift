//
//  AHConstants.swift
//  air_hockey
//
//  Created by Scott Burnette on 3/28/18.
//  Copyright © 2018 Scott Burnette. All rights reserved.
//

import SpriteKit
import UIKit

let BARRIER_CATEGORY_MASK : UInt32 = 0x1 << 1
let HANDLE_CATEGORY_MASK : UInt32 = 0x1 << 2
let PUCK_CATEGORY_MASK : UInt32 = 0x1 << 3
let INVISIBLE_BARRIER_CATEGORY_MASK : UInt32 = 0x1 << 4

let WIDTH : CGFloat = UIScreen.main.bounds.size.width
let HEIGHT : CGFloat = UIScreen.main.bounds.size.height
let PADDING : CGFloat = WIDTH > HEIGHT ? HEIGHT * 0.05 : WIDTH * 0.05

let HORIZONTAL_BAR : CGSize = CGSize(width: (WIDTH - 2.0 * PADDING) /  3.0, height: (HEIGHT - 2.0 * PADDING) * 0.01)
let VERTICAL_BAR : CGSize = CGSize(width: (WIDTH - 2.0 * PADDING) * 0.02, height: (HEIGHT - 3.0 * PADDING - 2.0 * HORIZONTAL_BAR.height))
let ARC_OFFSET : CGFloat = 10.0

let TABLE_TEXT_PADDING = 1.5 * PADDING
let TABLE_TEXT_SIZE = WIDTH / 10.0

let TABLE_TEXT : [CGPoint] = [
    CGPoint(x: WIDTH / 2.0 - PADDING - VERTICAL_BAR.width - TABLE_TEXT_PADDING, y: 0.5 + TABLE_TEXT_PADDING),
    CGPoint(x: WIDTH / 2.0 - PADDING - VERTICAL_BAR.width - TABLE_TEXT_PADDING, y: -0.5 - TABLE_TEXT_PADDING)
]

let INVISIBLE_BARRIERS : [CGRect] = [
    CGRect(x: -WIDTH / 2.0, y: -0.5, width: WIDTH, height: 1.0),
    CGRect(x: -HORIZONTAL_BAR.width / 2.0, y: HEIGHT / 2.0 - PADDING, width: HORIZONTAL_BAR.width, height: 1.0),
    CGRect(x: -HORIZONTAL_BAR.width / 2.0, y: -HEIGHT / 2.0 + PADDING, width: HORIZONTAL_BAR.width, height: 1.0)
]

let GLOW_BARRIERS : [CGRect] = [
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

let SHAPE_LINEWIDTH : CGFloat = 1.0

let STATIC_SHAPES : [CGPath] = [
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

// GLOW COMPONENTS
let EXTRA_LARGE_GLOW_WIDTH = PADDING
let LARGE_GLOW_WIDTH = PADDING / 1.5
let MEDIUM_GLOW_WIDTH = PADDING / 2.0
let SMALL_GLOW_WIDTH = PADDING / 3.0
let EXTRA_SMALL_GLOW_WIDTH = PADDING / 6.0

// GAME COMPONENTS
let HANDLE_RADIUS : CGFloat = HORIZONTAL_BAR.width / 5.0
let HANDLE_LINEWIDTH : CGFloat = HORIZONTAL_BAR.width / 10.0
let PLAYER_SIDE_SCORING_REGION : CGFloat = -HEIGHT / 2.0 + PADDING
let OPPONENT_SIDE_SCORING_REGION : CGFloat = HEIGHT / 2.0 - PADDING

struct PLAYER {
    static let pos : CGPoint = CGPoint(x: 0.0, y: -HEIGHT / 4.0)
    static let constraints : [SKConstraint] = [
        SKConstraint.positionX(
            SKRange(lowerLimit: -WIDTH / 2.0 + PADDING + VERTICAL_BAR.width, upperLimit: WIDTH / 2.0 - PADDING - VERTICAL_BAR.width)
        ),
        SKConstraint.positionY(SKRange(lowerLimit: -HEIGHT / 2.0 + PADDING + HORIZONTAL_BAR.height, upperLimit: 0.0))
    ]
    static let minX : CGFloat = -WIDTH / 2.0 + PADDING + VERTICAL_BAR.width
    static let minY : CGFloat = -HEIGHT / 2.0 + PADDING + HORIZONTAL_BAR.height
    static let maxX : CGFloat = WIDTH / 2.0 - PADDING - VERTICAL_BAR.width
    static let maxY : CGFloat = 0.0
}
    
struct OPPONENT {
    static let pos : CGPoint = CGPoint(x: 0.0, y: HEIGHT / 4.0)
    static let constraints : [SKConstraint] = [
        SKConstraint.positionX(
            SKRange(lowerLimit: -WIDTH / 2.0 + PADDING + VERTICAL_BAR.width, upperLimit: WIDTH / 2.0 - PADDING - VERTICAL_BAR.width)
        ),
        SKConstraint.positionY(SKRange(lowerLimit: 0.0, upperLimit: HEIGHT / 2.0 - PADDING - HORIZONTAL_BAR.height))
    ]
    static let minX : CGFloat = -WIDTH / 2.0 + PADDING + VERTICAL_BAR.width
    static let minY : CGFloat = 0.0
    static let maxX : CGFloat = WIDTH / 2.0 - PADDING - VERTICAL_BAR.width
    static let maxY : CGFloat = HEIGHT / 2.0 - PADDING - HORIZONTAL_BAR.height
}
    
struct PUCK {
    static let initPos : CGPoint = CGPoint(x: 0.0, y: 0.0)
    static let playerPos : CGPoint = CGPoint(x: 0.0, y: -HORIZONTAL_BAR.width / 2.0)
    static let oppPos : CGPoint = CGPoint(x: 0.0, y: HORIZONTAL_BAR.width / 2.0)
    static let radius : CGFloat = HORIZONTAL_BAR.width / 5.0
    static let innerRadius : CGFloat = HORIZONTAL_BAR.width / 6.0
}

// Menu and Button
let MENU_Z : CGFloat = 1000.0
let OVERLAY_RECT : CGRect = CGRect(x: -WIDTH /  2.0, y: -HEIGHT / 2.0, width: WIDTH, height: HEIGHT)
let MENU_RECT : CGRect = CGRect(x: -WIDTH / 3.0, y: -HEIGHT / 5.0, width: 2.0 * WIDTH / 3.0, height: 2.0 * HEIGHT / 5.0)
let MENU_LINEWIDTH : CGFloat = VERTICAL_BAR.width
let BUTTON_LINEWIDTH : CGFloat = VERTICAL_BAR.width

let START_MENU_PADDING_Y : CGFloat = MENU_RECT.height / 10.0
let BUTTON_HEIGHT : CGFloat = (MENU_RECT.height - 4.0 * START_MENU_PADDING_Y) / 3.0

let START_MENU_BUTTONS : [(CGRect, String)] = [
    (CGRect(x: -WIDTH / 4.0, y: MENU_RECT.height / 2.0 - START_MENU_PADDING_Y - BUTTON_HEIGHT, width: WIDTH / 2.0 , height: BUTTON_HEIGHT), "1 Player"),
    (CGRect(x: -WIDTH / 4.0, y: MENU_RECT.height / 2.0 - 2.0 * (START_MENU_PADDING_Y + BUTTON_HEIGHT), width: WIDTH / 2.0, height: BUTTON_HEIGHT), "2 Player"),
    (CGRect(x: -WIDTH / 4.0, y: MENU_RECT.height / 2.0 - 3.0 * (START_MENU_PADDING_Y + BUTTON_HEIGHT), width: WIDTH / 2.0, height: BUTTON_HEIGHT), "Settings")
]


// COLORS
let WHITE_ALPHA : UIColor = UIColor(hue: 1.0, saturation: 0.0, brightness: 0.25, alpha: 0.5)

let MENU_BORDER_COLOR : UIColor = UIColor(hue: 0.61, saturation: 1.0, brightness: 0.94, alpha: 1.0)

let OVERLAY_COLOR : UIColor = UIColor(hue: 0.0, saturation: 0.0, brightness: 0.20, alpha: 0.5)
