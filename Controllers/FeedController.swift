import UIKit

class FeedController:UIViewController{
    
    //MARK: VARIABLES
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var stackView: UIStackView!
    
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
    func addFeedItems(feedDatas:[FeedData]){
        for feedData in feedDatas{
            _ = addFeedItem(feedData: feedData)
        }
        view.layoutIfNeeded()
    }
    func addFeedItem(feedData: FeedData) -> FeedItem {
        let feedItem = FeedItem()
        let height = 50 + (feedItem.intrinsicContentSize.height - 50) * view.bounds.width / feedItem.intrinsicContentSize.width
        feedItem.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: floor(height))

        view.layoutIfNeeded()
        stackView.addArrangedSubview(feedItem)
        view.layoutIfNeeded()
        let axisLength = stackView.getAxisLength()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: axisLength)
        feedItem.populate(feedData: feedData)
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
