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
    func populate(name:String, value:Int){
        self.laurel.image = getLaurelImage(value: value)
        achievementLabel.text = name
        quantityLabel.text = "\(value)"
    }
    private func getLaurelImage(value:Int) -> UIImage {
        switch value {
            case 0...49: return UIImage(named: "iconLaurelGray")!
            case 50...499: return UIImage(named: "iconLaurelPlatinum")!
            case 500...998: return UIImage(named: "iconLaurelGold")!
            default: return UIImage(named: "iconLaurelRainbow")!
        }
    }
}
