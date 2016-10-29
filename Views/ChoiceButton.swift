import UIKit

class ChoiceButton:UIViewFromNib{
    
    //MARK: VARIABLES    
    @IBOutlet var bgImageView: UIImageView!
    @IBOutlet var fillImageView: UIImageView!
    @IBOutlet var darkFillImageView: UIImageView!
    @IBOutlet var fillWidth: NSLayoutConstraint!
    @IBOutlet var darkFillWidth: NSLayoutConstraint!
    @IBOutlet var label: UILabel!
    var onTap:VoidClosure?
    override public var intrinsicContentSize:CGSize{
        get {
            return CGSize(width: 300.0, height: 40.0)
        }
    }
    
    //MARK: INITIALIZATION
    override func getNibName() -> String{
        return "ChoiceButtonLayout"
    }
    override func customSetup() {
        fillWidth.constant = 0
        darkFillWidth.constant = 0
    }
    func setLabelTo(_ text:String){
        label.text = text
    }
    func setOnTap(onTap:@escaping VoidClosure){
        self.onTap = onTap
        enableTap(target: self, action: #selector(tap))
    }
    func tap(){ //should be private but need to expose selector
        if let onTap = onTap { onTap() }
    }

    //MARK: FUNCTIONS
    func fillTo(isSelected:Bool, percentage:CGFloat, seconds:Double){
        let imageView = isSelected ? fillImageView : darkFillImageView
        UIView.animate(withDuration: seconds, animations: {[weak self] in
            imageView!.frame = CGRect(x: imageView!.frame.origin.x, y: imageView!.frame.origin.y, width: percentage * self!.intrinsicContentSize.width, height: imageView!.frame.height)
        })
    }
    
}
