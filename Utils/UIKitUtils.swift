import Foundation
import UIKit

class UIKitUtils{
    
    static func getDesaturatedImage(image: UIImage) -> UIImage {
        let imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
        let colorSpace = CGColorSpaceCreateDeviceGray();
        let context = CGBitmapContextCreate(nil, Int(image.size.width), Int(image.size.height), 8, 0, colorSpace, CGImageAlphaInfo.None.rawValue)
        CGContextDrawImage(context, imageRect, image.CGImage);
        let imageRef = CGBitmapContextCreateImage(context);
        return UIImage(CGImage: imageRef!)
    }
}

class UIViewFromNib:UIView{
    
    //subclasses of this must override getBundleName
    
    override init(frame: CGRect){
        super.init(frame: frame)
        xibSetup()
        customSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        customSetup()
    }
    private func xibSetup(){
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: getNibName(), bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        frame = view.bounds
        //view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        addSubview(view)
    }
    override func intrinsicContentSize() -> CGSize {
        return frame.size
    }
    func getNibName() -> String{
        fatalError("You must override the getBundleName method in subclasses of UIViewFromNib")
    }
    func customSetup(){ //override this function for custom behavior post setup
    }
}

extension UIView {
    func removeSubviews(){
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    func enableTap(target target: AnyObject, action: Selector){
        userInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(gestureRecognizer)
    }
}

extension UIViewController {
    func spawnChildController(controller:UIViewController, view:UIView){
        addChildViewController(controller)
        view.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
    }
    func killChildControllers(){
        for child in childViewControllers {
            child.willMoveToParentViewController(nil)
            child.view.removeFromSuperview()
            child.removeFromParentViewController()
        }
    }
    func getParentOfType<T>(type:T.Type) -> T?{
        guard let parent = parentViewController else {
            return nil
        }
        if let parent = parent as? T {
            return parent
        } else {
            return parent.getParentOfType(T)
        }
    }
}

extension UIStackView {
    func fitToContent(){
        
        let count = arrangedSubviews.count
        var width = frame.width
        var height = frame.height
        
        if axis == .Horizontal {
            width = 0
            for view in arrangedSubviews {
                width += view.intrinsicContentSize().width
            }
            width += count > 1 ? (count - 1) * spacing : 0
        } else {
            height = 0
            for view in arrangedSubviews {
                height += view.intrinsicContentSize().height
            }
            height += count > 1 ? (count - 1) * spacing : 0
        }
        
        let size = CGSize(width: width, height: height)
        frame = CGRect(origin: frame.origin, size: size)
    }
}