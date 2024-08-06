//
//  ThemeOneScene.swift
//  ABC
//
//  Created by Apps Developer on 04/11/17.
//  Copyright © 2017 parasParas Technologies. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlayScene: SKScene,SKPhysicsContactDelegate {
    var LetterImage = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var colorImage = ["Blue","Orange","Purple","Black","Brown","Green","Red","White"]
    var shapesImage = ["Circle","Diamond","Oval","Rectangle","Square","Star","Triangle"]
    var numberImage = ["0","1","2","3","4","5","6","7","8","9"]
    var selecetedArray = [String]()
    var currentVC = UIViewController()
    var music:Music?
    var selectedTheme:Theme = Theme.ThemeOne
    var selectedType:PlayType = PlayType.Letter
    var backgroundTheme:SKSpriteNode!
    var possibleBalloons = ["ballon_1","ballon_2","ballon_3","ballon_4","ballon_5"]
    var gameTimer : Timer!
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        backgroundTheme = self.childNode(withName: "background") as! SKSpriteNode
        backgroundTheme.size = CGSize.init(width: frame.width, height: frame.height)
        backgroundTheme.position = CGPoint.init(x: frame.width/2, y: frame.height/2)
        switch selectedTheme {
        case Theme.ThemeOne:
            if music == Music.Play
            {
                SKTAudio.sharedInstance().stopBackgroundMusic()
                SKTAudio.sharedInstance().playBackgroundMusic("background_1.mp3")
            }
            backgroundTheme.texture = SKTexture.init(imageNamed: "background_4")
            break
        case Theme.ThemeTwo:
            if music == Music.Play
            {
                SKTAudio.sharedInstance().stopBackgroundMusic()
                SKTAudio.sharedInstance().playBackgroundMusic("background_2.mp3")
            }
            backgroundTheme.texture = SKTexture.init(imageNamed: "background_5")
            break
        case Theme.ThemeThree:
            if music == Music.Play
            {
                SKTAudio.sharedInstance().stopBackgroundMusic()
                SKTAudio.sharedInstance().playBackgroundMusic("background_1.mp3")
            }
            backgroundTheme.texture = SKTexture.init(imageNamed: "background_6")
            break
        case Theme.ThemeFour:
            if music == Music.Play
            {
                SKTAudio.sharedInstance().stopBackgroundMusic()
                SKTAudio.sharedInstance().playBackgroundMusic("background_2.mp3")
            }
            backgroundTheme.texture = SKTexture.init(imageNamed: "background_7")
            break
        }
        switch selectedType {
        case .Letter:
            selecetedArray = LetterImage
            gameTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(addBalloon), userInfo: nil, repeats: true)
            break
        case .Number:
            selecetedArray = numberImage
            gameTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(addBalloon), userInfo: nil, repeats: true)
            break
        case .Shape:
            selecetedArray = shapesImage
            gameTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(addBalloon), userInfo: nil, repeats: true)
            break
        case .Color:
            selecetedArray = colorImage
            gameTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(addColorBalloon), userInfo: nil, repeats: true)
            break
        }
        
    }
    func addBalloon(){
        
        possibleBalloons = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleBalloons) as! [String]
        let balloon = SKSpriteNode.init(imageNamed: possibleBalloons[0])
        let randomBalloonPosition = GKRandomDistribution(lowestValue: Int(balloon.size.width), highestValue: Int(self.frame.size.width-(balloon.size.width/2)))
        let position = CGFloat(randomBalloonPosition.nextInt())
        balloon.position = CGPoint.init(x: position, y: -balloon.size.height)
        balloon.zPosition = 1
        balloon.physicsBody = SKPhysicsBody.init(rectangleOf: balloon.size)
        balloon.physicsBody?.collisionBitMask = 0
        balloon.physicsBody?.affectedByGravity = false
        balloon.anchorPoint = CGPoint(x:CGFloat(0),y:CGFloat(0))
        
        let letterImage = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: selecetedArray) as! [String]
        let letter = SKSpriteNode.init(imageNamed: letterImage[0])
        letter.position = CGPoint.init(x: position, y: -balloon.size.height-38)
        letter.zPosition = 1
        letter.physicsBody = SKPhysicsBody.init(rectangleOf: letter.size)
        letter.physicsBody?.collisionBitMask = 0
        letter.physicsBody?.affectedByGravity = false
        letter.name = letterImage[0]
        balloon.name = possibleBalloons[0] + "-" + letterImage[0]
        
        var actionArr1 = [SKAction]()
        let action1 = SKAction.rotate(byAngle: CGFloat(0.18), duration: TimeInterval(2))
        let action2 = SKAction.rotate(byAngle: CGFloat(-0.18), duration: TimeInterval(2))
        actionArr1.append(action1)
        actionArr1.append(action2)
        balloon.run(SKAction.repeatForever(SKAction.sequence(actionArr1)))
        self.addChild(balloon)
        self.addChild(letter)
        let myJoint = SKPhysicsJointPin.joint(withBodyA: balloon.physicsBody!, bodyB: letter.physicsBody!, anchor: balloon.position)
        self.physicsWorld.add(myJoint)
        let animationDuration:TimeInterval = 10
        
        var actionArr = [SKAction]()
        let action = SKAction.move(to: CGPoint(x:position,y: self.frame.size.height+balloon.size.height+letter.size.height), duration: animationDuration)
        action.timingMode = .easeInEaseOut
        actionArr.append(action)
        
        actionArr.append(SKAction.removeFromParent())
        actionArr.append(SKAction.run {
            letter.removeFromParent()
        })
        balloon.run(SKAction.sequence(actionArr))
    }
    func addColorBalloon(){
        
        selecetedArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: selecetedArray) as! [String]
        let balloon = SKSpriteNode.init(imageNamed: selecetedArray[0])
        let randomBalloonPosition = GKRandomDistribution(lowestValue: Int(balloon.size.width), highestValue: Int(self.frame.size.width-(balloon.size.width/2)))
        let position = CGFloat(randomBalloonPosition.nextInt())
        balloon.position = CGPoint.init(x: position, y: -balloon.size.height)
        balloon.zPosition = 1
        balloon.physicsBody = SKPhysicsBody.init(rectangleOf: balloon.size)
        balloon.physicsBody?.collisionBitMask = 0
        balloon.physicsBody?.affectedByGravity = false
        balloon.anchorPoint = CGPoint(x:CGFloat(0),y:CGFloat(0))
        balloon.name = selecetedArray[0] + "-" + selecetedArray[0]
        
        var actionArr1 = [SKAction]()
        let action1 = SKAction.rotate(byAngle: CGFloat(0.18), duration: TimeInterval(2))
        let action2 = SKAction.rotate(byAngle: CGFloat(-0.18), duration: TimeInterval(2))
        actionArr1.append(action1)
        actionArr1.append(action2)
        balloon.run(SKAction.repeatForever(SKAction.sequence(actionArr1)))
        self.addChild(balloon)
        let animationDuration:TimeInterval = 10
        
        var actionArr = [SKAction]()
        let action = SKAction.move(to: CGPoint(x:position,y: self.frame.size.height+balloon.size.height), duration: animationDuration)
        action.timingMode = .easeInEaseOut
        actionArr.append(action)
        
        actionArr.append(SKAction.removeFromParent())
        balloon.run(SKAction.sequence(actionArr))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let nodesArr = self.nodes(at: location)
            let name = (nodesArr.first?.name ?? "")!.components(separatedBy: "-")
            if name.count>0 {
                if possibleBalloons.contains(name[0]) {
                    SKTAudio.sharedInstance().playSoundEffect("popup.mp3")
                    burstBalloon(balloonNode: nodesArr.first as! SKSpriteNode)
                }
                if selecetedArray.contains(name[0]) && selectedType == .Color {
                    SKTAudio.sharedInstance().playSoundEffect("popup.mp3")
                    burstBalloon(balloonNode: nodesArr.first as! SKSpriteNode)
                }
            }
            if nodesArr.first?.name == "back" || nodesArr.first?.name == "end_Game" {
                if music == Music.Play {
                    SKTAudio.sharedInstance().stopBackgroundMusic()
                    SKTAudio.sharedInstance().playBackgroundMusic("background.mp3")
                }
                self.currentVC.navigationController?.popViewController(animated: true)
            }
        }
    }
    func burstBalloon(balloonNode:SKSpriteNode)
    {
        let name = balloonNode.name?.components(separatedBy: "-")
        let f0 = SKTexture.init(imageNamed: name![0]+"_blast_1")
        let f1 = SKTexture.init(imageNamed: name![0]+"_blast_2")
        let f2 = SKTexture.init(imageNamed: name![0]+"_blast_3")
        let frames: [SKTexture] = [f0, f1, f2]
        
        let burstNode = SKSpriteNode.init(texture: frames[0])
        burstNode.position = balloonNode.position
        burstNode.position.x = (burstNode.position.x) + balloonNode.size.width/2 - 15
        burstNode.position.y = (burstNode.position.y)+balloonNode.size.height/2+25
        burstNode.zPosition = 2
        burstNode.run(SKAction.animate(with: frames, timePerFrame: 0.1)) {
            burstNode.removeFromParent()
        }
        SKTAudio.sharedInstance().playSoundEffect(name![1]+".mp3")
        self.addChild(burstNode)
        balloonNode.texture = SKTexture.init(imageNamed: "Thread")
        let animationDuration:TimeInterval!
        if balloonNode.position.y < self.frame.size.height/2 {
            animationDuration = 1
        }
        else {
            animationDuration = 2
        }
        if selectedType == .Color {
            var actionArr = [SKAction]()
            let action = SKAction.moveTo(y: -balloonNode.size.height, duration: animationDuration)
            action.timingMode = .easeInEaseOut
            actionArr.append(action)
            actionArr.append(SKAction.removeFromParent())
            balloonNode.run(SKAction.sequence(actionArr))
        }
        else {
            let jointNode = balloonNode.physicsBody?.joints[0].bodyB.node
            var actionArr = [SKAction]()
            let action = SKAction.moveTo(y: -balloonNode.size.height, duration: animationDuration)
            action.timingMode = .easeInEaseOut
            actionArr.append(action)
            actionArr.append(SKAction.removeFromParent())
            actionArr.append(SKAction.run {
                jointNode?.removeFromParent()
            })
            balloonNode.run(SKAction.sequence(actionArr))
        }
//        if let index = selecetedArray.index(of: name![1]) {
//            selecetedArray.remove(at: index)
//            for child in self.children{
//                if let bname = child.name {
//                    if bname.contains(name![1]) {
//                        child.removeFromParent()
//                    }
//                }
//            }
//        }
//
//        if selecetedArray.count == 0 {
//            gameTimer.invalidate()
//            gameTimer = nil
//
//            let balloon = SKSpriteNode.init(imageNamed: "end_Game")
//            balloon.position = CGPoint.init(x: self.size.width/2, y: -balloon.size.height)
//            balloon.zPosition = 1
//            balloon.name = "end_Game"
//            balloon.anchorPoint = CGPoint(x:CGFloat(0),y:CGFloat(0))
//            var actionArr1 = [SKAction]()
//            let action1 = SKAction.rotate(byAngle: CGFloat(0.08), duration: TimeInterval(2))
//            let action2 = SKAction.rotate(byAngle: CGFloat(-0.08), duration: TimeInterval(2))
//            actionArr1.append(action1)
//            actionArr1.append(action2)
//            balloon.run(SKAction.repeatForever(SKAction.sequence(actionArr1)))
//            self.addChild(balloon)
//            let animationDuration:TimeInterval = 7
//            var actionArr = [SKAction]()
//            let action = SKAction.move(to: CGPoint(x:(self.size.width/2)-(balloon.size.width/2),y: (self.frame.size.height/2)-(balloon.size.height/2)), duration: animationDuration)
//            action.timingMode = .easeInEaseOut
//            actionArr.append(action)
//            balloon.run(SKAction.sequence(actionArr))
//
//
//
//            for child in self.children{
//                if let name = child.name {
//                    if name.contains("ballon") {
//                        child.removeFromParent()
//                    }
//                }
//            }
//        }
        
        
    }
    override func update(_ currentTime: TimeInterval) {
    }
}
