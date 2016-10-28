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
        let height = 75 + (feedItem.intrinsicContentSize.height - 75) * view.bounds.width / feedItem.intrinsicContentSize.width
        feedItem.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: floor(height))

        stackView.addArrangedSubview(feedItem)
        let axisLength = stackView.getAxisLength()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: axisLength)
        feedItem.populate(feedData: feedData)
        feedItem.commentButton.addTarget(self, action: #selector(openComments), for: .touchUpInside)
        
        if let deepLink = feedData.deepLink {
            switch deepLink {
                case .STORY:
                    let portalController = getParentOfType(type: PortalController.self)!
                    feedItem.enableTap(target: portalController, action: #selector(PortalController.openStoryCard))
            }
        }
        
        if let videoId = feedData.videoId {
            view.layoutIfNeeded()
            feedItem.showVideo(videoId: videoId)
        }

        if feedData.imageNames.count > 1 {
            feedItem.enableTap(target: feedItem, action: #selector(FeedItem.nextFrame))
        }
        
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
