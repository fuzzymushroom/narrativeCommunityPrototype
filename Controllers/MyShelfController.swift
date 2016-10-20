import UIKit

class MyShelfController:UIViewController{
    
    //MARK: VARIABLES
    @IBOutlet var shortScene: UIView!
    @IBOutlet var credBar: CredBar!
    @IBOutlet var shelf1: Shelf!
    @IBOutlet var shelf2: Shelf!
    @IBOutlet var credBarBottomConstraint: NSLayoutConstraint!
    
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
        if profile.isSelf {
            _ = shelf2.addStory(storyId: "add")
        }
        credBar.karmaAchievement.enableTap(target: self, action: #selector(openKarma))
    }
    override func viewDidAppear(_ animated: Bool) {
        runShort()
    }
    private func populateCredBar(){
        credBar.karmaAchievement.populate(name: "karma", value: profile.karma)
        credBar.chaptersAchievement.populate(name: "chapters read", value: profile.chaptersRead)
        credBar.followersAchievement.populate(name: "followers", value: profile.followers)
        credBar.followButton.isSelected = false
        credBar.followButton.addTarget(credBar.followButton, action: #selector(UIButton.toggleSelected), for: .touchUpInside)
    }
    private func populateShelves(){
        
        let createCount = profile.createdStoryIds.count
        let portalController = getParentOfType(type: PortalController.self)
        
        if createCount > 0 {
            shelf1.setTitle(name: "Created by " + profile.username, qty: createCount)
            for storyId in profile.createdStoryIds{
                let story = shelf1.addStory(storyId: storyId)
                if let pc = portalController {
                    story.enableTap(target: pc, action: #selector(PortalController.openStoryCard))
                }
            }
        } else {
            shelf1.removeFromSuperview()
            let constraint = NSLayoutConstraint(item: credBar, attribute: .bottom, relatedBy: .equal, toItem: shelf2, attribute: .top, multiplier: 1, constant: 0)
            view.addConstraint(constraint)
        }
        
        shelf2.setTitle(name: "Recommended by " + profile.username, qty: profile.recommendedStoryIds.count)
        for storyId in profile.recommendedStoryIds {
            let story = shelf2.addStory(storyId: storyId)
            if let pc2 = portalController {
                story.enableTap(target: pc2, action: #selector(PortalController.openStoryCard))
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
    func openKarma(){
        let simplePopupController = SimplePopupController(image: UIImage(named: "bgKarma")!)
        simplePopupController.modalPresentationStyle = .overFullScreen
        present(simplePopupController, animated: false, completion: nil)
    }
}
