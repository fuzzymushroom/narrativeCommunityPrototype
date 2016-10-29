import UIKit

class StoryController: UIViewController {
    
    //MARK: VARIABLES
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var exitButton: UIButton!
    @IBOutlet var choice: Choice!
    
    let frames = [
        "story1",
        "story2",
        "story4",
        "story5"
    ]
    @IBOutlet var storyMenu: UIImageView!

    var frameIndex:Int!
    var didShowComments:Bool = false
    
    
    //MARK: OVERRIDES
    init(){
        let nibName = "StoryLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        goToFrame(index: 0)
        view.enableTap(target: self, action: #selector(advanceFrame))
        exitButton.addTarget(self, action: #selector(goProfile), for: .touchUpInside)
        closeStoryMenu()
    }
    
    //MARK: STORY NAVIGATION
    func goToFrame(index:Int){
        assert(index < frames.count, "frame index=\(index) out of bounds")
        frameIndex = index
        imageView.image = UIImage(named: frames[index])
    }
    func advanceFrame(){
        
        if frameIndex == 3 && !didShowComments {
            openComments()
            didShowComments = true
        } else if frameIndex == frames.count - 1 {
            view.gestureRecognizers?.forEach(view.removeGestureRecognizer)
            openEndOfChapter()
        } else {
            goToFrame(index: frameIndex + 1)
        }
        
        if frameIndex == 1 {
            choice.isHidden = false
            _ = choice.addChoice(label: "Confront him", percent: 0.25)
            _ = choice.addChoice(label: "Confront the woman", percent: 0.15)
            _ = choice.addChoice(label: "Flee the scene", percent: 0.6)
        } else if frameIndex == 2 {
            choice.isHidden = false
            choice.clearChoices()
            _ = choice.addChoice(label: "Honesty is best!", percent: 0.2)
            _ = choice.addChoice(label: "Sometimes ignorances is bliss.", percent: 0.1)
            _ = choice.addChoice(label: "Make HIM do it.", percent: 0.7)
        } else {
            choice.isHidden = true
        }
    }
    func hideChoice(){
        choice.isHidden = true
    }
    
    //MARK: STORY MENUS
    func openComments(){
        let masterController = getParentOfType(type: MasterController.self)!
        let thread = masterController.gameModel.getCommentThread(id: "story")
        let commentsController = CommentsController(thread: thread)
        commentsController.modalPresentationStyle = .overFullScreen
        //commentsController.isModalInPopover = true
        present(commentsController, animated: false, completion: nil)
    }
    func openStoryMenu(){
        storyMenu.isHidden = false
    }
    func closeStoryMenu(){
        storyMenu.isHidden = true
    }
    
    
    //MARK: END OF CHAPTER
    func openEndOfChapter(){
        killChildControllers()
        let eocc = EndOfChapterController()
        spawnChildController(controller: eocc, view: view)
    }
    
    //MARK: EXIT
    func goHome(){
        let masterController = getParentOfType(type: MasterController.self)!
        masterController.loadFullStoryCard()
    }
    func goProfile(){
        let masterController = getParentOfType(type: MasterController.self)!
        masterController.loadProfile(userId: "cass")
    }

}
