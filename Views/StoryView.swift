import UIKit

class StoryView:UIViewFromNib{
    
    //MARK: VARIABLES
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var exitButton: UIButton!
    
    //MARK: INITIALIZATION
    override func getNibName() -> String {
        return "StoryViewLayout"
    }
    override func customSetup() {
        
    }
    
    //MARK: UTILITY
    func showFrame(named name:String){
        imageView.image = UIImage(named: name)
    }
}