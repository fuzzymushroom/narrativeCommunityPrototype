import UIKit

class MyShelfPage:UIViewFromNib {
    
    @IBOutlet var shortScene: ShortScene!
    @IBOutlet var credBar: CredBar!
    @IBOutlet var shelfContainer: UIScrollView!
    
    override func getNibName() -> String{
        return "MyShelfLayout"
    }
    override func customSetup(){
    }
}