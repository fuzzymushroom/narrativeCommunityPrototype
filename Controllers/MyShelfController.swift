import UIKit

class MyShelfController:UIViewController{
    
    //MARK: VARIABLES
    let myShelfPage = MyShelfPage()
    
    //MARK: OVERRIDES
    override func loadView(){
        super.loadView()
        self.view = myShelfPage
    }
    override func viewDidLoad() {
        populateCredBar()
        populateShelves()
    }
    private func populateCredBar(){
        myShelfPage.credBar.vipAchievement.populate(laurel: .GRAY, name: "VIP", value: "LVL 1")
        myShelfPage.credBar.karmaAchievement.populate(laurel: .GOLD, name: "karma", value: "21.3k")
        myShelfPage.credBar.chaptersAchievement.populate(laurel: .GRAY, name: "chapters read", value: "12")
        myShelfPage.credBar.followersAchievement.populate(laurel: .PLAT, name: "followers", value: "9999")
        myShelfPage.credBar.followButton.selected = false
        myShelfPage.credBar.followButton.addTarget(self, action: #selector(toggleFollow), forControlEvents: .TouchUpInside)
    }
    private func populateShelves(){
        let shelf = Shelf()
        shelf.setTitle("Created by Pink-Haired Cass", qty: 13)
        myShelfPage.addShelf(shelf)
        let portalController = getParentOfType(PortalController)
        for _ in 1...6{
            let story = shelf.addStory()
            if let pc = portalController {
                story.enableTap(target: pc, action: #selector(PortalController.openStoryCard))
            }
        }
        
        let shelf2 = Shelf()
        shelf2.setTitle("Adored by Pink-Haired Cass", qty: 35)
        myShelfPage.addShelf(shelf2)
        shelf2.addStory()
        shelf2.addStory()
        shelf2.addStory()
        shelf2.addStory()
        shelf2.addStory()
        shelf2.addStory()
    }
    
    //MARK: FUNCTIONS
    func toggleFollow(){
        let followButton = myShelfPage.credBar.followButton
        followButton.selected = !followButton.selected
    }
}