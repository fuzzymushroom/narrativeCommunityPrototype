import UIKit

class MyShelfController:UIViewController{
    
    //MARK: VARIABLES
    @IBOutlet var shortScene: ShortScene!
    @IBOutlet var credBar: CredBar!
    @IBOutlet var shelf1: Shelf!
    @IBOutlet var shelf2: Shelf!
    
    //MARK: INITIALIZATION
    init(){
        let nibName = "MyShelfLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        populateCredBar()
        populateShelves()
    }
    private func populateCredBar(){
        credBar.vipAchievement.populate(laurel: .GRAY, name: "VIP", value: "LVL 1")
        credBar.karmaAchievement.populate(laurel: .GOLD, name: "karma", value: "21.3k")
        credBar.chaptersAchievement.populate(laurel: .GRAY, name: "chapters read", value: "12")
        credBar.followersAchievement.populate(laurel: .PLAT, name: "followers", value: "9999")
        credBar.followButton.isSelected = false
        credBar.followButton.addTarget(credBar.followButton, action: #selector(UIButton.toggleSelected), for: .touchUpInside)
    }
    private func populateShelves(){
        shelf1.setTitle(name: "Created by Pink-Haired Cass", qty: 13)
        let portalController = getParentOfType(type: PortalController.self)
        for _ in 1...6{
            let story = shelf1.addStory()
            if let pc = portalController {
                story.enableTap(target: pc, action: #selector(PortalController.openStoryCard))
            }
        }
        
        shelf2.setTitle(name: "Adored by Pink-Haired Cass", qty: 35)
        for _ in 1...6{
            let story = shelf2.addStory()
            if let pc = portalController {
                story.enableTap(target: pc, action: #selector(PortalController.openStoryCard))
            }
        }
    }
    
    //MARK: FUNCTIONS
}
