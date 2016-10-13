import UIKit

class NavCell:UIViewFromNib{
    
    @IBOutlet var label:UILabel!
    var onTap:VoidClosure?
    
    override func getNibName() -> String{
        return "NavCellLayout"
    }
    override func customSetup() {
    }
    
    func setName(name:String){
        label.text = name
    }
    func tap(){
        if let onTap = onTap { onTap() }
    }
    func showBorder(){
        layer.borderColor = UIColor.grayColor().CGColor
        layer.borderWidth = 1
    }
}