import UIKit

class FullStoryCardController: UIViewController {
    
    //MARK: VARIABLES
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var exitButton: UIButton!
    @IBOutlet var authorButton: UIButton!
    
    //MARK: OVERRIDES
    init(){
        let nibName = "StoryCardFullLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        imageView.image = UIImage(named: "pll_full")!
        exitButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        authorButton.addTarget(self, action: #selector(goAuthor), for: .touchUpInside)
    }
    
    //MARK: FUNCTIONS
    
    /*
    func openComments(){
        let masterController = getParentOfType(type: MasterController.self)!
        let thread = masterController.gameModel.getCommentThread(id: "story")
        let commentsController = CommentsController(thread: thread)
        commentsController.modalPresentationStyle = .overFullScreen
        //commentsController.isModalInPopover = true
        present(commentsController, animated: false, completion: nil)
    }
    */
    
    func goHome(){
        let masterController = getParentOfType(type: MasterController.self)!
        masterController.loadPortal(page: .HOME)
    }
    func goAuthor(){
        let masterController = getParentOfType(type: MasterController.self)!
        masterController.loadProfile(userId: "marlene")
    }

}
