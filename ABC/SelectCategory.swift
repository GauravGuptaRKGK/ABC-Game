//
//  SelectCategoryOne.swift
//  ABC
//
//  Created by Apps Developer on 01/11/17.
//  Copyright © 2017 parasParas Technologies. All rights reserved.
//

import SpriteKit

class SelectCategory: SKScene {
    var selectedTheme:Theme = Theme.ThemeOne
    
    var background:SKSpriteNode!
    var catView:SKSpriteNode!
    var bottomBlue:SKShapeNode!
    var bottomLightBlue:SKShapeNode!
    var bottomCreamView:SKShapeNode!
    var upperLightBue:SKShapeNode!
    var upperBlue:SKShapeNode!
    var upperCream:SKShapeNode!
    
    var kite_1:SKSpriteNode!
    var kite_2:SKSpriteNode!
    var shape_1:SKSpriteNode!
    var shape_2:SKSpriteNode!
    var one:SKSpriteNode!
    var two:SKSpriteNode!
    var letter_a:SKSpriteNode!
    var letter_b:SKSpriteNode!
    var Letters:SKSpriteNode!
    var Shapes:SKSpriteNode!
    var Numbers:SKSpriteNode!
    var Colors:SKSpriteNode!
    
    var letter:SKSpriteNode!
    var number:SKSpriteNode!
    var shape:SKSpriteNode!
    var color:SKSpriteNode!
    var back:SKSpriteNode!
    var currentVC = UIViewController()
    var music:Music?
    override func didMove(to view: SKView) {
        letter = self.childNode(withName: "letter") as! SKSpriteNode
        number = self.childNode(withName: "number") as! SKSpriteNode
        shape = self.childNode(withName: "shape") as! SKSpriteNode
        color = self.childNode(withName: "color") as! SKSpriteNode
        back = self.childNode(withName: "back") as! SKSpriteNode
        background = self.childNode(withName: "background") as! SKSpriteNode
        catView = self.childNode(withName: "cat_view") as! SKSpriteNode
        kite_1 = self.childNode(withName: "kite_1") as! SKSpriteNode
        kite_2 = self.childNode(withName: "kite_2") as! SKSpriteNode
        shape_1 = self.childNode(withName: "shape_1") as! SKSpriteNode
        shape_2 = self.childNode(withName: "shape_2") as! SKSpriteNode
        one = self.childNode(withName: "one") as! SKSpriteNode
        two = self.childNode(withName: "two") as! SKSpriteNode
        letter_a = self.childNode(withName: "letter_a") as! SKSpriteNode
        letter_b = self.childNode(withName: "letter_b") as! SKSpriteNode
        Letters = self.childNode(withName: "Letters") as! SKSpriteNode
        Shapes = self.childNode(withName: "Shapes") as! SKSpriteNode
        Numbers = self.childNode(withName: "Numbers") as! SKSpriteNode
        Colors = self.childNode(withName: "Colors") as! SKSpriteNode
        
        background.size = CGSize.init(width: frame.width, height: frame.height)
        background.position = CGPoint.init(x: frame.width/2, y: frame.height/2)
        
        catView.size = CGSize.init(width: frame.width, height: frame.height/5)
        catView.position = CGPoint.init(x: frame.width/2, y: catView.frame.height/2)
        
        kite_1.position = CGPoint.init(x: frame.width/6, y: catView.frame.height + frame.height/10)
        kite_2.position = CGPoint.init(x: frame.width/2-15, y: catView.frame.height + frame.height/10)
        color.position = CGPoint.init(x: (5 * frame.width)/6, y: catView.frame.height + 30)
        Colors.position = CGPoint.init(x: (5 * frame.width)/6, y: catView.frame.height + frame.height/10+30)
        
        bottomLightBlue = SKShapeNode.init(rectOf: CGSize.init(width: frame.width, height: frame.height/5))
        bottomLightBlue.fillColor = UIColor.init(red: 223/255.0, green: 240/255.0, blue: 255/255.0, alpha: 1.0)
        bottomLightBlue.position = CGPoint.init(x: frame.width/2, y: catView.frame.height + frame.height/10)
        self.addChild(bottomLightBlue)
        
        one.position = CGPoint.init(x: frame.width/6, y: (catView.frame.height*3) + frame.height/10)
        two.position = CGPoint.init(x: frame.width/2-15, y: (catView.frame.height*3) + frame.height/10)
        number.position = CGPoint.init(x: (5 * frame.width)/6, y: (catView.frame.height*3) + 30)
        Numbers.position = CGPoint.init(x: (5 * frame.width)/6, y: (catView.frame.height*3) + frame.height/10+30)
        
        upperLightBue = SKShapeNode.init(rectOf: CGSize.init(width: frame.width, height: frame.height/5))
        upperLightBue.fillColor = UIColor.init(red: 223/255.0, green: 240/255.0, blue: 255/255.0, alpha: 1.0)
        upperLightBue.position = CGPoint.init(x: frame.width/2, y: (catView.frame.height*3) + frame.height/10)
        self.addChild(upperLightBue)
        
        bottomBlue = SKShapeNode.init(rectOf: CGSize.init(width: frame.width/3+10, height: frame.height/5))
        bottomBlue.fillColor = UIColor.init(red: 150/255.0, green: 193/255.0, blue: 233/255.0, alpha: 1.0)
        bottomBlue.position = CGPoint.init(x: (5 * frame.width)/6-5, y: catView.frame.height + frame.height/10)
        self.addChild(bottomBlue)
        
        upperBlue = SKShapeNode.init(rectOf: CGSize.init(width: frame.width/3+10, height: frame.height/5))
        upperBlue.fillColor = UIColor.init(red: 150/255.0, green: 193/255.0, blue: 233/255.0, alpha: 1.0)
        upperBlue.position = CGPoint.init(x: (5 * frame.width)/6-5, y: (catView.frame.height*3) + frame.height/10)
        self.addChild(upperBlue)
        
        
        shape_1.position = CGPoint.init(x: frame.width/2+15, y: (catView.frame.height*2) + frame.height/10)
        shape_2.position = CGPoint.init(x: (5 * frame.width)/6, y: (catView.frame.height*2) + frame.height/10)
        shape.position = CGPoint.init(x: frame.width/6, y: (catView.frame.height*2) + 30)
        Shapes.position = CGPoint.init(x: frame.width/6, y: (catView.frame.height*2) + frame.height/10+30)
        
        bottomCreamView = SKShapeNode.init(rectOf: CGSize.init(width: frame.width/3+10, height: frame.height/5))
        bottomCreamView.fillColor = UIColor.init(red: 251/255.0, green: 225/255.0, blue: 167/255.0, alpha: 1.0)
        bottomCreamView.position = CGPoint.init(x: frame.width/6+5, y: (catView.frame.height*2) + frame.height/10)
        self.addChild(bottomCreamView)
        
        letter_a.position = CGPoint.init(x: frame.width/2+15, y: (catView.frame.height*4) + frame.height/10)
        letter_b.position = CGPoint.init(x: (5 * frame.width)/6, y: (catView.frame.height*4) + frame.height/10)
        letter.position = CGPoint.init(x: frame.width/6, y: (catView.frame.height*4) + 30)
        Letters.position = CGPoint.init(x: frame.width/6, y: (catView.frame.height*4) + frame.height/10+30)
        
        upperCream = SKShapeNode.init(rectOf: CGSize.init(width: frame.width/3+10, height: frame.height/5))
        upperCream.fillColor = UIColor.init(red: 251/255.0, green: 225/255.0, blue: 167/255.0, alpha: 1.0)
        upperCream.position = CGPoint.init(x: frame.width/6+5, y: (catView.frame.height*4) + frame.height/10)
        self.addChild(upperCream)
        
        
        if frame.height < 600 {
            Colors.size = CGSize.init(width: frame.width/3 - 20, height: Colors.frame.height - 5)
            Shapes.size = CGSize.init(width: frame.width/3 - 20, height: Shapes.frame.height - 5)
            Numbers.size = CGSize.init(width: frame.width/3 - 20, height: Numbers.frame.height - 5)
            Letters.size = CGSize.init(width: frame.width/3 - 20, height: Letters.frame.height - 5)
            color.size = CGSize.init(width: frame.width/3 - 20, height: color.frame.height - 5)
            shape.size = CGSize.init(width: frame.width/3 - 20, height: shape.frame.height - 5)
            number.size = CGSize.init(width: frame.width/3 - 20, height: number.frame.height - 5)
            letter.size = CGSize.init(width: frame.width/3 - 20, height: letter.frame.height - 5)
            
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in:self) {
            let nodeArr = self.nodes(at: location)
            if nodeArr.first?.name == "letter"{
          
                let vc = self.currentVC.storyboard?.instantiateViewController(withIdentifier: "PlayVC") as! PlayVC
                vc.selectedTheme = selectedTheme
                vc.selectedType = PlayType.Letter
                vc.music = music
                self.currentVC.navigationController?.pushViewController(vc, animated: true)
            }
            if nodeArr.first?.name == "number"{
                let vc = self.currentVC.storyboard?.instantiateViewController(withIdentifier: "PlayVC") as! PlayVC
                vc.selectedTheme = selectedTheme
                vc.selectedType = PlayType.Number
                vc.music = music
                self.currentVC.navigationController?.pushViewController(vc, animated: true)
            }
            if nodeArr.first?.name == "shape"{
                let vc = self.currentVC.storyboard?.instantiateViewController(withIdentifier: "PlayVC") as! PlayVC
                vc.selectedTheme = selectedTheme
                vc.selectedType = PlayType.Shape
                vc.music = music
                self.currentVC.navigationController?.pushViewController(vc, animated: true)
            }
            if nodeArr.first?.name == "color"{
                let vc = self.currentVC.storyboard?.instantiateViewController(withIdentifier: "PlayVC") as! PlayVC
                vc.selectedTheme = selectedTheme
                vc.selectedType = PlayType.Color
                vc.music = music
                self.currentVC.navigationController?.pushViewController(vc, animated: true)
            }
            if nodeArr.first?.name == "back"{
                self.currentVC.navigationController?.popViewController(animated: true)
            }
        }
        
    }

}
