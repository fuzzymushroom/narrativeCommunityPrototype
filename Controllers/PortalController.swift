
import UIKit

class PortalController:UIViewController {

    
    //MARK: VARIABLES
    
    @IBOutlet var pageContainer: UIView!
    @IBOutlet var navToggle: UIImageView!
    @IBOutlet var pageLabel: UILabel!
    @IBOutlet var navMenu: NavMenu!
    
    
    //MARK: NAV MENU
    private func populateNavMenu(){
        navMenu.addNavCell(named:"Home", image: UIImage(named: "navHome")!, onTap: { [unowned self] in self.navigateToPage(page: .HOME) })
        navMenu.addNavCell(named:"Featured", image: UIImage(named: "navFeatured")!, onTap: { [unowned self] in self.navigateToPage(page: .BLANK) })
        navMenu.addNavCell(named:"Feed", image: UIImage(named: "navFeed")!, onTap: { [unowned self] in self.navigateToPage(page: .FEED) })
        navMenu.addNavCell(named:"Mean Girls", image: UIImage(named: "navMeanGirls")!, onTap: { [unowned self] in self.navigateToPage(page: .BLANK) })
        navMenu.addNavCell(named:"Demi Stories", image: UIImage(named: "navDemi")!, onTap: { [unowned self] in self.navigateToPage(page: .BLANK) })
        navMenu.addNavCell(named:"Genres", image: UIImage(named: "navGenres")!, onTap: { [unowned self] in self.navigateToPage(page: .BLANK) })
        navMenu.addNavCell(named:"Adventures", image: UIImage(named: "navAdventures")!, onTap: { [unowned self] in self.navigateToPage(page: .BLANK) })
        navMenu.addNavCell(named:"User Stories", image: UIImage(named: "navUserStories")!, onTap: { [unowned self] in self.navigateToPage(page: .BLANK) })
        navMenu.addNavCell(named:"Create", image: UIImage(named: "navCreate")!, onTap: { [unowned self] in self.navigateToPage(page: .BLANK) })
        navMenu.addNavCell(named:"Profile", image: UIImage(named: "navProfile")!, onTap: { [unowned self] in self.navigateToPage(page: .PROFILE) })
        navMenu.addNavCell(named:"Settings", image: UIImage(named: "navSettings")!, onTap: { [unowned self] in self.navigateToPage(page: .BLANK) })
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
            case .HOME: launchHome()
            case .PROFILE: launchProfile(userId: "max")
            case .FEED: launchFeed()
            default: killChildControllers()
        }
    }
    func launchHome(){
        killChildControllers()
        let controller = UIViewController()
        spawnChildController(controller: controller, view: pageContainer)
        view.layoutIfNeeded()
        let imageView = UIImageView(frame: pageContainer.bounds)
        imageView.image = UIImage(named: "bgHome")!
        controller.view.addSubview(imageView)
        controller.view.enableTap(target: self, action: #selector(openStoryCard))
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
        let masterController = getParentOfType(type: MasterController.self)!
        let gameModel = masterController.gameModel
        let feedDatas = gameModel.getFeedDatas()
        feedController.addFeedItems(feedDatas: feedDatas)
        //recommendation.enableTap(target: self, action: #selector(openStoryCard))
    }
    
    //MARK: OVERLAYS
    func openStoryCard(){
        let storyCard = StoryCard(frame: view.bounds)
        view.addSubview(storyCard)
        
        storyCard.imageView.image = UIImage(named: "pll")
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
    case FEED = "Feed"
    case PROFILE = "Profile"
    case BLANK = "Placeholder"
}
enum DeepLink {
    case STORY
}
