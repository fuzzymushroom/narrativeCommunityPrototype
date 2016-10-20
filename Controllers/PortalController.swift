
import UIKit

class PortalController:UIViewController {

    
    //MARK: VARIABLES
    
    @IBOutlet var pageContainer: UIView!
    @IBOutlet var navToggle: UIImageView!
    @IBOutlet var pageLabel: UILabel!
    @IBOutlet var navMenu: NavMenu!
    
    
    //MARK: NAV MENU
    private func populateNavMenu(){
        navMenu.addNavCell(named:"Home", onTap: { [unowned self] in self.navigateToPage(page: .HOME) })
        navMenu.addNavCell(named:"Explore", onTap: { [unowned self] in self.navigateToPage(page: .EXPLORE) })
        navMenu.addNavCell(named:"Feed", onTap: { [unowned self] in self.navigateToPage(page: .FEED) })
        navMenu.addNavCell(named:"Tell Your Story", onTap: { [unowned self] in self.navigateToPage(page: .PROFILE) })
    }
    func toggleNavMenu(){
        navMenu.isHidden ? expandNavMenu() : collapseNavMenu()
    }
    func expandNavMenu(){
        navMenu.isHidden = false
    }
    func collapseNavMenu(){
        navMenu.isHidden = true
    }

    
    //MARK: NAVIGATION
    func navigateToPage(page:Page){
        collapseNavMenu()
        pageLabel.text = page.rawValue
        switch page {
            case .PROFILE: launchProfile(userId: "max")
            case .FEED: launchFeed()
            default: killChildControllers()
        }
    }
    func launchProfile(userId:String){
        killChildControllers()
        let masterController = getParentOfType(type: MasterController.self)!
        let gameModel = masterController.gameModel
        let profile = gameModel.getProfile(userId: userId)
        pageLabel.text = profile.username
        let profileController = ProfileController(profile: profile)
        spawnChildController(controller: profileController, view: pageContainer)
    }
    private func launchFeed(){
        killChildControllers()
        let feedController = FeedController()
        spawnChildController(controller: feedController, view: pageContainer)
        
        let recommendation = feedController.addFeedItem(imageName: "feedRecommendation")
        recommendation.enableTap(target: self, action: #selector(openStoryCard))
        _ = feedController.addFeedItem(imageName: "feedCapture")
        _ = feedController.addFeedItem(imageName: "feedCollaborators")
        _ = feedController.addFeedItem(imageName: "feedShort")
    }
    
    //MARK: OVERLAYS
    func openStoryCard(){
        let storyCard = StoryCard(frame: view.bounds)
        view.addSubview(storyCard)
        
        storyCard.imageView.image = UIImage(named: "campfire")
        storyCard.enableTap(target: storyCard, action: #selector(StoryCard.removeFromSuperview))
        let masterController = getParentOfType(type: MasterController.self)!
        storyCard.launchButton.addTarget(masterController, action: #selector(MasterController.loadStory), for: .touchUpInside)
    }
    
    //MARK: OVERRIDES
    init(){
        let nibName = "PortalLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        populateNavMenu()
    }
    override func viewDidAppear(_ animated: Bool) {
        collapseNavMenu()
        navToggle.enableTap(target: self, action: #selector(toggleNavMenu))
    }
}

enum Page:String {
    case HOME = "Home"
    case EXPLORE = "Explore"
    case FEED = "Feed"
    case PROFILE = "Profile"
}
