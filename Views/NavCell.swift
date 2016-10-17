import UIKit

class NavCell:UIViewFromNib{
    
    @IBOutlet var label:UILabel!
    var onTap:VoidClosure?
    
    override func getNibName() -> String{
        return "NavCellLayout"
    }
    override func customSetup() {
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
    }
    
    func setName(name:String){
        label.text = name
    }
    func setOnTap(onTap:@escaping VoidClosure){
        self.onTap = onTap
        enableTap(target: self, action: #selector(tap))
    }
    func tap(){ //should be private but need to expose selector
        if let onTap = onTap { onTap() }
    }
}
