import UIKit

class PortalView:UIViewFromNib{
    
    //MARK: VARIABLES

    @IBOutlet var headerView: HeaderView!
    @IBOutlet var pageContainer: UIView!
    let navMenu = NavMenu()
    
    //MARK: INITIALIZATION
    override func getNibName() -> String{
        return "PortalLayout"
    }
    override func customSetup() {
        addSubview(navMenu)
        navMenu.frame.origin = CGPoint(x: 0, y: headerView.frame.height)
        collapseNavMenu()
    }
    
    //MARK: NAV MENU
    func toggleNavMenu(){
        navMenu.isExpanded ? collapseNavMenu() : expandNavMenu()
    }
    func expandNavMenu(){
        navMenu.frame.origin.x = 0
        navMenu.isExpanded = true
    }
    func collapseNavMenu(){
        navMenu.frame.origin.x = -navMenu.frame.width
        navMenu.isExpanded = false
    }
    
    //MARK: ELEMENT ACCESSORS
    func getNavMenuToggle() -> UIImageView {
        return headerView.navToggle
    }
}