//
//  PlayVC.swift
//  ABC
//
//  Created by Harish Kumar on 18/11/17.
//  Copyright © 2017 parasParas Technologies. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class PlayVC: UIViewController {
    var selectedTheme:Theme?
    var selectedType:PlayType?
    var music:Music?
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        let scene = SKScene.init(fileNamed: "PlayScene.sks") as! PlayScene
        let skView = view as! SKView
        scene.currentVC = self
        scene.music = music
        scene.selectedTheme = selectedTheme ?? Theme.ThemeOne
        scene.selectedType = selectedType ?? PlayType.Letter
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
