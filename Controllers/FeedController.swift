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
        let recommendation = addFeedItem()
        recommendation.setImage(image: UIImage(named: "feedRecommendation")!)
        
        let capture = addFeedItem()
        capture.setImage(image: UIImage(named: "feedCapture")!)
        
        let survey = addFeedItem()
        survey.setImage(image:UIImage(named: "feedSurvey")!)
        
        let movie = addFeedItem()
        movie.setImage(image:UIImage(named: "feedMovie")!)
    }
    
    //MARK: FUNCTIONS
    
    func addFeedItem() -> FeedItem {
        let feedItem = FeedItem()
        feedItem.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: feedItem.intrinsicContentSize.height * view.bounds.width / feedItem.intrinsicContentSize.width)
        stackView.addArrangedSubview(feedItem)
        let axisLength = stackView.getAxisLength()
        stackViewHeight.constant = axisLength
        scrollView.contentSize = CGSize(width: view.bounds.width, height: axisLength)
        return feedItem
    }
/*
    func addFeedItem() -> FeedItem {
        let feedItem = FeedItem(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: CGFloat(190)))
        stackView.addArrangedSubview(feedItem)
        let axisLength = stackView.getAxisLength()
        stackViewHeight.constant = axisLength
        scrollView.contentSize = CGSize(width: view.bounds.width, height: axisLength)
        view.layoutIfNeeded()
        return feedItem
    }
 */

    /*
    func addFeedItem() -> UIImageView {
        let storyId = "sundosia"
        let thumb = UIImage(named: "\(storyId)_thumbnail")
        let story = UIImageView(image: thumb)
        stackView.addArrangedSubview(story)
        let axisLength = stackView.getAxisLength()
        stackViewHeight.constant = axisLength
        scrollView.contentSize = CGSize(width: view.bounds.width, height: axisLength)
        return story
    }
 */
    
}
