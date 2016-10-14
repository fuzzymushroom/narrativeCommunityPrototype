import UIKit

class MasterController: UIViewController {

    //MARK: Variables
    let gameModel = GameModel()
    
    //MARK: Setup
    func loadPortal(){
        killChildControllers()
        spawnChildController(controller: PortalController(), view: view)
    }
    func loadStory(){
        killChildControllers()
        spawnChildController(controller: StoryController(), view: view)
    }
    
    //MARK: UIViewController overrides
    override func viewDidLoad() {
        loadPortal()
    }
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

//TODO:
