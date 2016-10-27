import UIKit

class CredBar:UIViewFromNib{
    
    //MARK: VARIABLES
    
    @IBOutlet var karmaAchievement: Achievement!
    @IBOutlet var chaptersAchievement: Achievement!
    @IBOutlet var rosesAchievement: Achievement!
    @IBOutlet var followButton: UIButton!
    

    //MARK: OVERRIDES
    override func getNibName() -> String{
        return "CredBarLayout"
    }
    override func customSetup() {
    }
    
}
