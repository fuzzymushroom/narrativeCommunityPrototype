import UIKit
import SpriteKit

class GameViewController: ViewControllerPlus {

    //MARK: Variables

    let gameModel = GameModel()
    let gameScene = GameScene(fileNamed: "ProfileLayout")!
    //let gameHud = GameHud()
    
    //MARK: Setup
    private func setupProfile(){
        gameScene.showBackground(imageNamed: "bgCollege")
        gameScene.showAvatar(imageNamed: "characterJSR")
    }
    
    
    //MARK: UIViewController overrides
    override func viewDidLoad() {
        let skView = self.view as! SKView
        //skView.showsFPS = true
        //skView.showsNodeCount = true
        //skView.ignoresSiblingOrder = false
        
        gameScene.scaleMode = .AspectFill
        skView.presentScene(gameScene)
        
        /*
        gameHud.zPosition = GameScene.Z_HUD
        gameHud.actionCounter.hudDelegate = self
        gameScene.addChild(gameHud)
        */
        
        setupProfile()
    }
    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        //if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
        return .Portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

//TODO: