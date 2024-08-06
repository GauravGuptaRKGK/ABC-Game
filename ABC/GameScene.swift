//
//  GameScene.swift
//  ABC
//
//  Created by Harish Kumar on 29/10/17.
//  Copyright © 2017 parasParas Technologies. All rights reserved.
//

import SpriteKit
import GameplayKit
enum Music {
    case Play
    case Stop
}
class GameScene: SKScene {
    var background = SKSpriteNode.init(imageNamed: "background_1")
    var backgroundBottom = SKSpriteNode.init(imageNamed: "backgroundBottom")
    var startNode = SKSpriteNode.init(imageNamed: "StartIcon")
    var helpNode = SKSpriteNode.init(imageNamed: "help_icon")
    var musicNode = SKSpriteNode.init(imageNamed: "music_icon")
    var possibleBalloons = ["ballon_1","ballon_2","ballon_3","ballon_4","ballon_5"]
    var gameTimer : Timer!
    var currentVC = UIViewController()
    var music = Music.Play
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        backgroundBottom.position = CGPoint.init(x: frame.size.width/2, y: backgroundBottom.size.height/2)
        backgroundBottom.zPosition = 3
        addChild(backgroundBottom)
        addChild(background)
        SKTAudio.sharedInstance().playBackgroundMusic("background.mp3")
        SKTAudio.sharedInstance().backgroundMusicPlayer?.volume = 0.4
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(addBalloon), userInfo: nil, repeats: true)
        helpNode.position = CGPoint(x: helpNode.size.width / 2 + 15, y:self.frame.size.height - ((helpNode.size.height / 2)+15))
        helpNode.zPosition = 5
        helpNode.name = "help"
        addChild(helpNode)
        musicNode.position = CGPoint(x: self.frame.size.width - ((musicNode.size.width / 2)+15), y:self.frame.size.height - ((musicNode.size.height / 2)+15))
        musicNode.zPosition = 5
        musicNode.name = "music"
        addChild(musicNode)
        startNode.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        startNode.zPosition = 5
        startNode.name = "start"
        addChild(startNode)
    }
    func addBalloon(){
        possibleBalloons = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: possibleBalloons) as! [String]
        let balloon = SKSpriteNode.init(imageNamed: possibleBalloons[0])
        let randomBalloonPosition = GKRandomDistribution(lowestValue: Int(balloon.size.width/2), highestValue: Int(self.frame.size.width-(balloon.size.width/2)))
        let position = CGFloat(randomBalloonPosition.nextInt())
        balloon.position = CGPoint.init(x: position, y: -balloon.size.height)
        balloon.zPosition = 1
        balloon.name = possibleBalloons[0]
        balloon.anchorPoint = CGPoint(x:CGFloat(0),y:CGFloat(0))
        var actionArr1 = [SKAction]()
        let action1 = SKAction.rotate(byAngle: CGFloat(0.18), duration: TimeInterval(2))
        let action2 = SKAction.rotate(byAngle: CGFloat(-0.18), duration: TimeInterval(2))
        actionArr1.append(action1)
        actionArr1.append(action2)
        balloon.run(SKAction.repeatForever(SKAction.sequence(actionArr1)))
        self.addChild(balloon)
        let animationDuration:TimeInterval = 14
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
            if nodesArr.first?.name == "start" {
                gameTimer.invalidate()
                gameTimer = nil
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let scene = SKScene.init(fileNamed: "SelectTheme.sks") as! SelectTheme
                scene.currentVC = self.currentVC
                scene.music = music
                scene.scaleMode = .resizeFill
                self.view?.presentScene(scene, transition: transition)
            }
            if nodesArr.first?.name == "music" {
                let node = nodesArr.first as! SKSpriteNode
                if music == Music.Play {
                    node.texture = SKTexture.init(image: UIImage.init(named: "music_close_icon")!)
                    music = Music.Stop
                    SKTAudio.sharedInstance().stopBackgroundMusic()
                }
                else {
                    music = Music.Play
                    node.texture = SKTexture.init(image: UIImage.init(named: "music_icon")!)
                    SKTAudio.sharedInstance().playBackgroundMusic("background.mp3")
                }
            }
            if nodesArr.first?.name == "help"
            {
                
            }
            if possibleBalloons.contains((nodesArr.first?.name ?? "")!) {
                 SKTAudio.sharedInstance().playSoundEffect("popup.mp3")
                burstBalloon(balloonNode: nodesArr.first as! SKSpriteNode)
            }
        }
    }
    func burstBalloon(balloonNode:SKSpriteNode) {
        let name = balloonNode.name
        let f0 = SKTexture.init(imageNamed: name!+"_blast_1")
        let f1 = SKTexture.init(imageNamed: name!+"_blast_2")
        let f2 = SKTexture.init(imageNamed: name!+"_blast_3")
        let frames: [SKTexture] = [f0, f1, f2]
        // Load the first frame as initialization
        let burstNode = SKSpriteNode.init(texture: frames[0])
        burstNode.position = balloonNode.position
        burstNode.position.x = (burstNode.position.x) + balloonNode.size.width/2 - 15
        burstNode.position.y = (burstNode.position.y)+balloonNode.size.height/2+25
        burstNode.zPosition = 2
        burstNode.run(SKAction.animate(with: frames, timePerFrame: 0.1)) {
            burstNode.removeFromParent()
        }
        balloonNode.removeFromParent()
        self.addChild(burstNode)
        let thread = SKSpriteNode.init(imageNamed: "Thread")
        thread.position = balloonNode.position
        thread.position.y = balloonNode.position.y - 30
        thread.zPosition = 1
        thread.name = "Thread"
        self.addChild(thread)
        let animationDuration:TimeInterval!
        if balloonNode.position.y < self.frame.size.height/2 {
            animationDuration = 1
        }
        else {
            animationDuration = 2
        }
        var actionArr = [SKAction]()
        let action = SKAction.moveTo(y: -thread.size.height, duration: animationDuration)
        action.timingMode = .easeInEaseOut
        actionArr.append(action)
        actionArr.append(SKAction.removeFromParent())
        thread.run(SKAction.sequence(actionArr))
    }
    override func update(_ currentTime: TimeInterval) {
        
    }
}

