import UIKit

class StoryController: UIViewController {
    
    //MARK: VARIABLES
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var exitButton: UIButton!
    @IBOutlet var choice: Choice!
    
    let frames = [
        "story0",
        "story1",
        "story2",
        "story3"
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
        
        if frameIndex == 1 && !didShowComments{
            openComments(threadId: "peanutGallery")
            didShowComments = true
        } else if frameIndex == 3 && !didShowComments {
            openComments(threadId: "storyChoice")
            didShowComments = true
        } else if frameIndex == frames.count - 1 {
            view.gestureRecognizers?.forEach(view.removeGestureRecognizer)
            openEndOfChapter()
        } else {
            didShowComments = false
            goToFrame(index: frameIndex + 1)
        }
        
        if frameIndex == 2 {
            choice.isHidden = false
            _ = choice.addChoice(label: "Confront him", percent: 0.25)
            _ = choice.addChoice(label: "Confront the woman", percent: 0.15)
            _ = choice.addChoice(label: "Flee the scene", percent: 0.6)
        } else {
            choice.isHidden = true
        }
    }
    func hideChoice(){
        choice.isHidden = true
    }
    
    //MARK: STORY MENUS
    func openComments(threadId:String){
        let masterController = getParentOfType(type: MasterController.self)!
        let thread = masterController.gameModel.getCommentThread(id: threadId)
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
