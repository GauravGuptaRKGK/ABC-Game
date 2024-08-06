//
//  SelectTheme.swift
//  ABC
//
//  Created by Apps Developer on 01/11/17.
//  Copyright © 2017 parasParas Technologies. All rights reserved.
//

import SpriteKit
enum Theme {
    case ThemeOne
    case ThemeTwo
    case ThemeThree
    case ThemeFour
}
enum PlayType {
    case Letter
    case Number
    case Shape
    case Color
}
class SelectTheme: SKScene {
    var theme_1:SKSpriteNode!
    var theme_2:SKSpriteNode!
    var theme_3:SKSpriteNode!
    var theme_4:SKSpriteNode!
    var background:SKSpriteNode!
    var headingLabel:SKSpriteNode!
    var currentVC = UIViewController()
    var music : Music?
    override func didMove(to view: SKView) {
        theme_1 = self.childNode(withName: "theme_1") as! SKSpriteNode
        theme_2 = self.childNode(withName: "theme_2") as! SKSpriteNode
        theme_3 = self.childNode(withName: "theme_3") as! SKSpriteNode
        theme_4 = self.childNode(withName: "theme_4") as! SKSpriteNode
        background = self.childNode(withName: "bakground") as! SKSpriteNode
        headingLabel = self.childNode(withName: "selectTheme") as! SKSpriteNode
        
        background.size = CGSize.init(width: frame.width, height: frame.height)
        background.position = CGPoint.init(x: frame.width/2, y: frame.height/2)

        headingLabel.position = CGPoint.init(x: frame.width/2, y: frame.height-headingLabel.frame.height-20)
        
        if frame.height > 600 {
            theme_1.size = CGSize.init(width: frame.width/2, height: frame.width/2)
            theme_1.position = CGPoint.init(x: theme_1.frame.width/2, y: frame.height - 250)
            
            theme_2.size = CGSize.init(width: frame.width/2, height: frame.width/2)
            theme_2.position = CGPoint.init(x: frame.width - theme_2.frame.width/2, y: frame.height - 250)
            
            theme_3.size = CGSize.init(width: frame.width/2, height: frame.width/2)
            theme_3.position = CGPoint.init(x: theme_3.frame.width/2, y: 200)
            
            theme_4.size = CGSize.init(width: frame.width/2, height: frame.width/2)
            theme_4.position = CGPoint.init(x: frame.width - theme_4.frame.width/2, y: 200)
        }
        else {
            theme_1.size = CGSize.init(width: frame.width/2, height: frame.width/2)
            theme_1.position = CGPoint.init(x: theme_1.frame.width/2, y: frame.height - 200)
            
            theme_2.size = CGSize.init(width: frame.width/2, height: frame.width/2)
            theme_2.position = CGPoint.init(x: frame.width - theme_2.frame.width/2, y: frame.height - 200)
            
            theme_3.size = CGSize.init(width: frame.width/2, height: frame.width/2)
            theme_3.position = CGPoint.init(x: theme_3.frame.width/2, y: 150)
            
            theme_4.size = CGSize.init(width: frame.width/2, height: frame.width/2)
            theme_4.position = CGPoint.init(x: frame.width - theme_4.frame.width/2, y: 150)
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in:self) {
            let nodeArr = self.nodes(at: location)
            if nodeArr.first?.name == "theme_1"{
                let vc = self.currentVC.storyboard?.instantiateViewController(withIdentifier: "SelectGameTypeVC") as! SelectGameTypeVC
                vc.selectedTheme = Theme.ThemeOne
                vc.music = music
                self.currentVC.navigationController?.pushViewController(vc, animated: true)
            }
            if nodeArr.first?.name == "theme_2"{
                let vc = self.currentVC.storyboard?.instantiateViewController(withIdentifier: "SelectGameTypeVC") as! SelectGameTypeVC
                vc.selectedTheme = Theme.ThemeTwo
                vc.music = music
                self.currentVC.navigationController?.pushViewController(vc, animated: true)

            }
            if nodeArr.first?.name == "theme_3"{
                let vc = self.currentVC.storyboard?.instantiateViewController(withIdentifier: "SelectGameTypeVC") as! SelectGameTypeVC
                vc.selectedTheme = Theme.ThemeThree
                vc.music = music
                self.currentVC.navigationController?.pushViewController(vc, animated: true)


            }
            if nodeArr.first?.name == "theme_4"{
                let vc = self.currentVC.storyboard?.instantiateViewController(withIdentifier: "SelectGameTypeVC") as! SelectGameTypeVC
                vc.selectedTheme = Theme.ThemeFour
                vc.music = music
                self.currentVC.navigationController?.pushViewController(vc, animated: true)

            }
            
        }
    }

}
