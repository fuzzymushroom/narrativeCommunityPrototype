import UIKit

class FeedController:UIViewController{
    
    //MARK: VARIABLES
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var stackViewHeight: NSLayoutConstraint!
    
    //MARK: INITIALIZATION
    init(){
        let nibName = "FeedLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    //MARK: FUNCTIONS
    
    func addFeedItem(imageName:String) -> FeedItem {
        let feedItem = FeedItem()
        feedItem.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: feedItem.intrinsicContentSize.height * view.bounds.width / feedItem.intrinsicContentSize.width)
        stackView.addArrangedSubview(feedItem)
        let axisLength = stackView.getAxisLength()
        stackViewHeight.constant = axisLength
        scrollView.contentSize = CGSize(width: view.bounds.width, height: axisLength)
        feedItem.setImage(image:UIImage(named: imageName)!)
        feedItem.commentButton.addTarget(self, action: #selector(openComments), for: .touchUpInside)
        return feedItem
    }
    func openComments(){
        let masterController = getParentOfType(type: MasterController.self)!
        let thread = masterController.gameModel.getCommentThread(id: "portal")
        let commentsController = CommentsController(thread: thread)
        commentsController.modalPresentationStyle = .overFullScreen
        //commentsController.isModalInPopover = true
        present(commentsController, animated: false, completion: nil)
    }
}
