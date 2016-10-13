import UIKit

class ProfileController:UIViewController{
    
    //MARK: VARIABLES
    let profilePage = ProfilePage()
    
    //MARK: OVERRIDES
    override func loadView(){
        super.loadView()
        self.view = profilePage
    }
    override func viewDidLoad() {
        openShelf()
        profilePage.shelfTab.addTarget(self, action: #selector(openShelf), forControlEvents: .TouchUpInside)
        profilePage.postTab.addTarget(self, action: #selector(openPosts), forControlEvents: .TouchUpInside)
    }
    
    //MARK: TAB NAVIGATION
    func openShelf(){
        killChildControllers()
        spawnChildController(MyShelfController(), view: profilePage.viewport)
        profilePage.selectTab(profilePage.shelfTab)
    }
    func openPosts(){
        profilePage.viewport.removeSubviews()
        profilePage.selectTab(profilePage.postTab)
    }
}