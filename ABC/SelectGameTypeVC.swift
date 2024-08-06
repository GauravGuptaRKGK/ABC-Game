//
//  SelectGameTypeVC.swift
//  ABC
//
//  Created by Harish Kumar on 17/11/17.
//  Copyright © 2017 parasParas Technologies. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class SelectGameTypeVC: UIViewController {
    var selectedTheme:Theme?
    var music:Music?
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SKScene.init(fileNamed: "SelectCategory.sks") as! SelectCategory
        let skView = view as! SKView
        scene.currentVC = self
        scene.music = music
        scene.selectedTheme = selectedTheme ?? Theme.ThemeOne
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
