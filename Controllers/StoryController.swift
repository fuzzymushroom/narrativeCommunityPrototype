import UIKit

class StoryController: UIViewController {
    
    //MARK: VARIABLES
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var exitButton: UIButton!
    let frames = [
        "story1",
        "story2",
        "story3",
        "story4",
        "story5",
        "story6",
        "story7",
        "story8",
        "story9",
        "story10"
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
        if frameIndex == 9 && !didShowComments {
            openComments()
            didShowComments = true
        } else if frameIndex == frames.count - 1 {
            view.gestureRecognizers?.forEach(view.removeGestureRecognizer)
            openEndOfChapter()
        } else {
            goToFrame(index: frameIndex + 1)
        }
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
        masterController.loadPortal(page: .HOME)
    }
    func goProfile(){
        let masterController = getParentOfType(type: MasterController.self)!
        masterController.loadProfile(userId: "cass")
    }

}
