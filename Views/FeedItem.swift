import UIKit
import youtube_ios_player_helper.YTPlayerView

class FeedItem:UIViewFromNib{
    
    //MARK: VARIABLES
    @IBOutlet var header: UIView!
    @IBOutlet var mugshot: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mediaLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var youtubeView: YTPlayerView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var actionBar: UIView!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    override public var intrinsicContentSize:CGSize{
        get {
            return frame.size
        }
    }
    
    var frameIndex:Int = 0
    var imageNames:[String]!
    
    //MARK: INITIALIZATION
    override func getNibName() -> String{
        return "FeedItemLayout"
    }
    override func customSetup() {
        youtubeView.isHidden = true
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
        self.imageNames = feedData.imageNames
        if feedData.imageNames.count > 0 {
            if let feedImage = UIImage(named: feedData.imageNames[0]) {
                imageView.image = feedImage
            }
        }
        header.isHidden = !feedData.showHeader
        playButton.isHidden = feedData.imageNames.count <= 1
        actionBar.isHidden = !feedData.showActionBar
    }
    func toggleLike(){
        likeButton.isSelected = !likeButton.isSelected
    }
    func showVideo(videoId:String){
        youtubeView.isHidden = false
        youtubeView.load(withVideoId: videoId)
    }
    func nextFrame(){
        playButton.isHidden = true
        frameIndex = (frameIndex + 1) % imageNames.count
        if let feedImage = UIImage(named: imageNames[frameIndex]){
            imageView.image = feedImage
        }
    }
}
