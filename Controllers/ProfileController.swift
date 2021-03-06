import UIKit

class ProfileController:UIViewController{
    
    //MARK: VARIABLES
    var activeTab:StylizedButton?
    let profile:Profile!

    
    @IBOutlet var shelfTab: StylizedButton!
    @IBOutlet var choicesTab: StylizedButton!
    @IBOutlet var postTab: StylizedButton!
    @IBOutlet var viewport: UIView!

    
    static let COLOR_TAB_DESELECTED = UIColor(red: 0.914, green: 0.914, blue: 0.914, alpha: 1)
    static let COLOR_TAB_SELECTED = UIColor(red: 0.867, green: 0.620, blue: 0.184, alpha: 1)
    
    //MARK: INITIALIZATION
    init(profile:Profile){
        self.profile = profile
        let nibName = "ProfileLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {

    }
    override func viewDidAppear(_ animated: Bool) {
        shelfTab.showBorder()
        shelfTab.deselectedColor = ProfileController.COLOR_TAB_DESELECTED
        shelfTab.selectedColor = ProfileController.COLOR_TAB_SELECTED
        shelfTab.addTarget(self, action: #selector(openShelf), for: .touchUpInside)
        
        choicesTab.showBorder()
        choicesTab.deselectedColor = ProfileController.COLOR_TAB_DESELECTED
        choicesTab.selectedColor = ProfileController.COLOR_TAB_SELECTED
        choicesTab.addTarget(self, action: #selector(openChoices), for: .touchUpInside)
        
        postTab.showBorder()
        postTab.deselectedColor = ProfileController.COLOR_TAB_DESELECTED
        postTab.selectedColor = ProfileController.COLOR_TAB_SELECTED
        postTab.addTarget(self, action: #selector(openPosts), for: .touchUpInside)
        
        openShelf()
    }
    
    //MARK: TAB NAVIGATION
    func openShelf(){
        selectTab(tab: shelfTab)
        killChildControllers()
        let myShelfController = MyShelfController(profile: profile)
        spawnChildController(controller: myShelfController, view: viewport)
    }
    func openChoices(){
        selectTab(tab: choicesTab)
        killChildControllers()
        let choicesController = ChoicesController()
        spawnChildController(controller: choicesController, view: viewport)
        let masterController = getParentOfType(type: MasterController.self)!
        let choiceDatas = masterController.gameModel.getChoiceDatas()
        choicesController.addChoices(choiceDatas: choiceDatas)
    }
    func openPosts(){
        killChildControllers()
        let feedController = FeedController()
        spawnChildController(controller: feedController, view: viewport)
        if profile.isSelf {
            let feedData = FeedData()
            feedData.mugshotName = nil
            feedData.username = nil
            feedData.mediaName = nil
            feedData.date = nil
            feedData.imageNames = ["feedPost"]
            feedData.showHeader = false
            feedData.showActionBar = false
            
            _ = feedController.addFeedItem(feedData: feedData)
        }
        feedController.addFeedItems(feedDatas: profile.feedDatas)
        selectTab(tab: postTab)
    }
    private func selectTab(tab:StylizedButton){
        if let activeTab = activeTab{
            activeTab.colorDeselected()
        }
        activeTab = tab
        tab.colorSelected()
    }
}
