import UIKit

class MasterController: UIViewController {

    //MARK: Variables

    let gameModel = GameModel()
    let masterView = MasterView()
    let gameScene = GameScene(fileNamed: "ProfileLayout")!
    //let gameHud = GameHud()
    
    //MARK: Setup
    private func setupProfile(){
        view.addSubview(masterView)
        //gameScene.showBackground(imageNamed: "bgCollege")
        //gameScene.showAvatar(imageNamed: "characterJSR")
    }
    
    
    //MARK: UIViewController overrides
    override func viewDidLoad() {
//        let view = self.view
        
//        gameScene.scaleMode = .AspectFill
//        skView.presentScene(gameScene)
        
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
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

//TODO: