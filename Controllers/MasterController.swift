import UIKit

class MasterController: UIViewController {

    //MARK: Variables
    let gameModel = GameModel()
    
    //MARK: Setup
    func loadPortal(){
        killChildControllers()
        spawnChildController(PortalController(), view: view)
    }
    func loadStory(){
        killChildControllers()
        spawnChildController(StoryController(), view: view)
    }
    
    //MARK: UIViewController overrides
    override func viewDidLoad() {
        loadPortal()
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