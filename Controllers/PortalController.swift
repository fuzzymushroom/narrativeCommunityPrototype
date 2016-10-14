import UIKit

class PortalController: UIViewController {

    //MARK: VARIABLES
    let portalView = PortalView()
    
    //MARK: NAV MENU
    private func populateNavMenu(){
        addPage(page: .HOME)
        addPage(page: .EXPLORE)
        addPage(page: .FEED)
        addPage(page: .PROFILE)
    }
    func addPage(page:Page){
        let navCell = NavCell()
        navCell.setName(name: page.rawValue)
        navCell.onTap = { [unowned self] in self.navigateToPage(page: page) }
        portalView.navMenu.addNavCell(navCell: navCell)
        
        navCell.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: navCell, action: #selector(NavCell.tap))
        navCell.addGestureRecognizer(gestureRecognizer)
    }
    private func enableNavMenu(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: portalView, action: #selector(PortalView.toggleNavMenu))
        let navMenuToggle = portalView.getNavMenuToggle()
        navMenuToggle.isUserInteractionEnabled = true
        navMenuToggle.addGestureRecognizer(tapGestureRecognizer)
    }
    func navigateToPage(page:Page){
        portalView.collapseNavMenu()
        portalView.pageContainer.removeSubviews()
        portalView.headerView.setPageName(name: page.rawValue)
        switch page {
            case .PROFILE: launchProfile()
            case .FEED: launchFeed()
            default: break
        }
    }
    func launchProfile(){
        killChildControllers()
        spawnChildController(controller: ProfileController(), view: portalView.pageContainer)
    }
    func launchFeed(){
        print("launch feed")
    }
    
    //MARK: OVERLAYS
    func openStoryCard(){
        let storyCard = StoryCard()
        portalView.addSubview(storyCard)
        storyCard.imageView.image = UIImage(named: "campfire")
        storyCard.enableTap(target: storyCard, action: #selector(StoryCard.removeFromSuperview))
        let masterController = getParentOfType(type: MasterController.self)!
        storyCard.launchButton.addTarget(masterController, action: #selector(MasterController.loadStory), for: .touchUpInside)
    }
    
    //MARK: OVERRIDES
    override func loadView(){
        super.loadView()
        self.view = portalView
    }
    override func viewDidLoad() {
        populateNavMenu()
        enableNavMenu()
        navigateToPage(page: .PROFILE)
    }
}

enum Page:String {
    case HOME = "Home"
    case EXPLORE = "Explore"
    case FEED = "Feed"
    case PROFILE = "Profile"
}
