import UIKit

class FeedItem:UIViewFromNib{
    
    //MARK: VARIABLES
    override public var intrinsicContentSize:CGSize{
        get {
            return frame.size
        }
    }
    @IBOutlet var header: UIView!
    @IBOutlet var mugshot: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mediaLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var actionBar: UIView!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    
    //MARK: INITIALIZATION
    override func getNibName() -> String{
        return "FeedItemLayout"
    }
    override func customSetup() {
        likeButton.addTarget(self, action: #selector(toggleLike), for: .touchUpInside)
    }
    
    //MARK: FUNCTIONS
    func populate(feedData:FeedData){
        if let mugshotName = feedData.mugshotName {
            if let image = UIImage(named: mugshotName){
                mugshot.image = image
            }
        }
        nameLabel.text = feedData.username ?? ""
        mediaLabel.text = feedData.mediaName ?? ""
        dateLabel.text = feedData.date ?? ""
        if let feedImage = UIImage(named: feedData.imageName) {
            imageView.image = feedImage
        }
        header.isHidden = !feedData.showHeader
        playButton.isHidden = !feedData.showPlayButton
        actionBar.isHidden = !feedData.showActionBar
    }
    func toggleLike(){
        likeButton.isSelected = !likeButton.isSelected
    }
}
