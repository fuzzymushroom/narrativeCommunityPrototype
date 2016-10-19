import UIKit

class MyShelfController:UIViewController{
    
    //MARK: VARIABLES
    @IBOutlet var shortScene: UIView!
    @IBOutlet var credBar: CredBar!
    @IBOutlet var shelf1: Shelf!
    @IBOutlet var shelf2: Shelf!
    
    let profile:Profile!
    var shortController:ShortController!
    
    //MARK: INITIALIZATION
    init(profile:Profile){
        self.profile = profile
        let nibName = "MyShelfLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        shortController = ShortController()
        spawnChildController(controller: shortController, view: shortScene)
        populateCredBar()
        populateShelves()
    }
    override func viewDidAppear(_ animated: Bool) {
        runShort()
    }
    private func populateCredBar(){
        credBar.vipAchievement.populate(laurel: .GRAY, name: "VIP", value: "LVL 1")
        credBar.karmaAchievement.populate(laurel: .GOLD, name: "karma", value: "\(profile.karma)")
        credBar.chaptersAchievement.populate(laurel: .GRAY, name: "chapters read", value: "\(profile.chaptersRead)")
        credBar.followersAchievement.populate(laurel: .PLAT, name: "followers", value: "\(profile.followers)")
        credBar.followButton.isSelected = false
        credBar.followButton.addTarget(credBar.followButton, action: #selector(UIButton.toggleSelected), for: .touchUpInside)
    }
    private func populateShelves(){
        shelf1.setTitle(name: "Created by " + profile.username, qty: profile.createdStoryIds.count)
        let portalController = getParentOfType(type: PortalController.self)
        for storyId in profile.createdStoryIds{
            let story = shelf1.addStory(storyId: storyId)
            if let pc = portalController {
                story.enableTap(target: pc, action: #selector(PortalController.openStoryCard))
            }
        }
        
        shelf2.setTitle(name: "Recommended by " + profile.username, qty: profile.recommendedStoryIds.count)
        for storyId in profile.recommendedStoryIds{
            let story = shelf2.addStory(storyId: storyId)
            if let pc = portalController {
                story.enableTap(target: pc, action: #selector(PortalController.openStoryCard))
            }
        }
    }
    
    //MARK: FUNCTIONS
    private func runShort(){
        shortController.spawnCharacter(fileName: profile.characterImageName, atLocation: .STAGE_RIGHT)
        shortController.walkToThenSpeak(
            location: .RIGHT_ISH,
            name: profile.username,
            quote: profile.quote
        )
    }
}
