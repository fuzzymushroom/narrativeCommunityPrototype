import UIKit

class Achievement:UIViewFromNib{
    
    //MARK: VARIABLES
    
    @IBOutlet var laurel: UIImageView!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var achievementLabel: UILabel!
    
    //MARK: INITIALIZATION
    override func getNibName() -> String{
        return "AchievementLayout"
    }
    override func customSetup() {
    }
    func populate(laurel:Laurel, name:String, value:String){
        self.laurel.image = UIImage(named: laurel.rawValue)
        achievementLabel.text = name
        quantityLabel.text = value
    }
}

enum Laurel:String {
    case GRAY = "iconLaurelGray"
    case GOLD = "iconLaurelGold"
    case PLAT = "iconLaurelPlatinum"
}
