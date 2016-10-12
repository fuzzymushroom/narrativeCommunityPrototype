import UIKit

class HeaderView:UIViewFromNib{
    
    @IBOutlet var navToggle: UIImageView!
    @IBOutlet var pageLabel: UILabel!
    
    override func getNibName() -> String{
        return "HeaderLayout"
    }
    override func customSetup() {
    }
    
    func setPageName(name:String){
        pageLabel.text = name
    }
}
