import UIKit

class Comment:UIViewFromNib{
    
    //MARK: VARIABLES
    
    @IBOutlet var mugshot: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    //MARK: OVERRIDES
    override public var intrinsicContentSize:CGSize{
        get {
            return frame.size
        }
    }
    override func getNibName() -> String{
        return "CommentLayout"
    }
    override func customSetup() {
    }
    
    //MARK: FUNCTIONS
    func populate(mugshot:UIImage, username:String, comment:String){
        self.mugshot.image = mugshot
        usernameLabel.text = username
        commentLabel.text = comment
    }
}
