//
//  GameScene.swift
//  GettingTouchPosition
//
//  Created by ryan on 3/9/16.
//  Copyright (c) 2016 Indicane. All rights reserved.
// The Epic Face will allways go to the players touch, can be used for any touching in the cordinate system

import SpriteKit

class GameScene: SKScene {
    let face = SKSpriteNode(imageNamed: "epicFace")
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()
        addChild(face)
    }
    
    
    
    func playerTapp(location: CGPoint){  //Detects a tap, only give cordinates once
        face.position = CGPoint(x: location.x, y: location.y)
    }
    
    
    func playerSwipe(location: CGPoint){ //Detects a moving touch, constantly runs with the cordinates
        face.position = CGPoint(x: location.x, y: location.y)
    }
    
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { //Gets the location of a touch as a UITouch
            return
        }
        let touchLocation = touch.locationInNode(self)//Converts UITouch into a CGPoint
        playerTapp(touchLocation)
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else { //Gets the location of a swipe as a UITouch
            return
        }
        let touchLocation = touch.locationInNode(self)//Converts UITouch into a CGPoint
        playerSwipe(touchLocation)
    }
}