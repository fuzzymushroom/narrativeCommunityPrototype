import UIKit

class StoryCard:UIViewFromNib{
    
    //MARK: VARIABLES
    
    @IBOutlet var filter: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var launchButton: UIButton!
    
    //MARK: INITIALIZATION
    override func getNibName() -> String {
        return "StoryCardLayout"
    }
    override func customSetup() {
        
    }
}