import UIKit

class PortalController: UIViewController {

    //MARK: VARIABLES
    let portalView = PortalView()
    
    //MARK: NAV MENU
    private func populateNavMenu(){
        addPage(.HOME)
        addPage(.EXPLORE)
        addPage(.FEED)
        addPage(.PROFILE)
    }
    func addPage(page:Page){
        let navCell = NavCell()
        navCell.setName(page.rawValue)
        navCell.onTap = { [unowned self] in self.navigateToPage(page) }
        portalView.navMenu.addNavCell(navCell)
        
        navCell.userInteractionEnabled = true
        //let gestureRecognizer = UITapGestureRecognizer(target: navCell, action: #selector(NavCell.tap))
        let gestureRecognizer = UITapGestureRecognizer(target: navCell, action: #selector(NavCell.tap))
        navCell.addGestureRecognizer(gestureRecognizer)
    }
    private func enableNavMenu(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: portalView, action: #selector(PortalView.toggleNavMenu))
        let navMenuToggle = portalView.getNavMenuToggle()
        navMenuToggle.userInteractionEnabled = true
        navMenuToggle.addGestureRecognizer(tapGestureRecognizer)
    }
    func navigateToPage(page:Page){
        portalView.collapseNavMenu()
        portalView.pageContainer.removeSubviews()
        portalView.headerView.setPageName(page.rawValue)
        switch page {
            case .PROFILE: launchProfile()
            case .FEED: launchFeed()
            default: break
        }
    }
    func launchProfile(){
        killChildControllers()
        spawnChildController(ProfileController(), view: portalView.pageContainer)
    }
    func launchFeed(){
        print("launch feed")
    }
    
    //MARK: OVERRIDES
    override func loadView(){
        super.loadView()
        self.view = portalView
    }
    override func viewDidLoad() {
        populateNavMenu()
        enableNavMenu()
        navigateToPage(.PROFILE)
    }
}

enum Page:String {
    case HOME = "Home"
    case EXPLORE = "Explore"
    case FEED = "Feed"
    case PROFILE = "Profile"
}