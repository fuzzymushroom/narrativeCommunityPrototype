import UIKit

class MasterView:UIViewFromNib{
    
    @IBOutlet var label: UILabel!
    
    override func getNibName() -> String{
        return "MasterLayout"
    }
    override func customSetup() {
        label.text = "I see you"
    }
}
