//
//  GameScene.swift
//  blocker
//
//  Created by Brandon Jenniges on 10/5/15.
//  Copyright (c) 2015 Brandon Jenniges. All rights reserved.
//

import SpriteKit

let BallCategoryName = "ball"
let PaddleCategoryName = "paddle"
let BlockCategoryName = "block"
let BlockNodeCategoryName = "blockNode"

class GameScene: SKScene {
    
    var lastUpdateTime: NSTimeInterval?
    var dt: NSTimeInterval!
    
    var backgrounds = [SKSpriteNode]()
    let numberOfBackgrounds = 3
    
    let colors = [UIColor.yellowColor(), UIColor.redColor(), UIColor.blueColor()]
    
    let velocity = CGPointMake(0, -80)
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        setupBackgrounds()
        print(self.frame)
        
        
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        if let lastUpdateTime = lastUpdateTime {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        moveBackground()
    }
    
    func setupBackgrounds() {
        for index in 1...numberOfBackgrounds {
            let background = SKSpriteNode(color: colors[index - 1], size: self.frame.size)
            background.anchorPoint = CGPointMake(0, 0)
            background.position = CGPointMake(0, CGFloat(index - 1) * background.frame.size.height)
            backgrounds.append(background)
            self.addChild(background)
        }
    }
    
    func moveBackground() {
        for background in backgrounds {
            let amountToMove = CGPointMultiplyScalar(velocity, scale: CGFloat(dt))
            background.position = CGPointAdd(background.position, p2: amountToMove)
            if background.position.y <= -background.frame.size.height {
                let yPos = background.size.height * CGFloat(numberOfBackgrounds - 1)
                print(yPos)
                background.position = CGPointMake(0 , yPos)
            }
            
        }
    }
    
    func CGPointAdd(p1: CGPoint, p2: CGPoint) -> CGPoint {
        return CGPointMake(p1.x + p2.x, p1.y + p2.y)
    }
    
    func CGPointMultiplyScalar(p1: CGPoint, scale: CGFloat) -> CGPoint {
        return CGPointMake(p1.x * scale, p1.y * scale)
    }
}

