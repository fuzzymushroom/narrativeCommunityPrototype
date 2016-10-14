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
        profilePage.shelfTab.addTarget(self, action: #selector(openShelf), for: .touchUpInside)
        profilePage.postTab.addTarget(self, action: #selector(openPosts), for: .touchUpInside)
    }
    
    //MARK: TAB NAVIGATION
    func openShelf(){
        killChildControllers()
        spawnChildController(controller: MyShelfController(), view: profilePage.viewport)
        profilePage.selectTab(tab: profilePage.shelfTab)
    }
    func openPosts(){
        profilePage.viewport.removeSubviews()
        profilePage.selectTab(tab: profilePage.postTab)
    }
}
