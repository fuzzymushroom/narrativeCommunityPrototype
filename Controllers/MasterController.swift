import UIKit

class MasterController: UIViewController {

    //MARK: Variables
    let gameModel = GameModel()
    
    //MARK: Setup
    func loadPortal(page: Page){
        killChildControllers()
        let portalController = PortalController()
        spawnChildController(controller: portalController, view: view)
        portalController.navigateToPage(page: page)
    }
    func loadStory(){
        killChildControllers()
        spawnChildController(controller: StoryController(), view: view)
    }
    func loadProfile(userId:String){
        killChildControllers()
        let portalController = PortalController()
        spawnChildController(controller: portalController, view: view)
        portalController.launchProfile(userId: userId)
    }
    
    //MARK: UIViewController overrides
    override func viewDidLoad() {
    }
    override func viewDidAppear(_ animated: Bool) {
        loadPortal(page: .PROFILE)
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
