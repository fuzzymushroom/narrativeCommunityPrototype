import UIKit

class NavCell:UIViewFromNib{
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label:UILabel!
    @IBOutlet var iconBadge: UIImageView!
    var onTap:VoidClosure?
    
    override func getNibName() -> String{
        return "NavCellLayout"
    }
    override func customSetup() {
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
    }
    
    func populate(name:String, image:UIImage, showBadge:Bool){
        label.text = name
        imageView.image = image
        if !showBadge { iconBadge.isHidden = true }
    }
    func setOnTap(onTap:@escaping VoidClosure){
        self.onTap = onTap
        enableTap(target: self, action: #selector(tap))
    }
    func tap(){ //should be private but need to expose selector
        if let onTap = onTap { onTap() }
    }
}
