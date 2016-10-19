import UIKit

class FeedItem:UIViewFromNib{
    
    //MARK: VARIABLES
    @IBOutlet var imageView: UIImageView!
    override public var intrinsicContentSize:CGSize{
        get {
            return frame.size
        }
    }
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
    func setImage(image:UIImage){
        imageView.image = image
    }
    func toggleLike(){
        likeButton.isSelected = !likeButton.isSelected
    }
}
