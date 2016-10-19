import UIKit

class FeedItem:UIViewFromNib{
    
    //MARK: VARIABLES
    @IBOutlet var imageView: UIImageView!
    override public var intrinsicContentSize:CGSize{
        get {
            return frame.size
        }
    }
    
    //MARK: INITIALIZATION
    override func getNibName() -> String{
        return "FeedItemLayout"
    }
    override func customSetup() {
    }
    
    //MARK: FUNCTIONS
    func setImage(image:UIImage){
        imageView.image = image
    }
}
