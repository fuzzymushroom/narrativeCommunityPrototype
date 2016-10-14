import Foundation
import UIKit

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
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: getNibName(), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        frame = view.bounds
        //view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        addSubview(view)
    }
    /*
    override func intrinsicContentSize() -> CGSize {
        return frame.size
    }
 */
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
    func enableTap(target: AnyObject, action: Selector){
        isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(gestureRecognizer)
    }
}

extension UIViewController {
    func spawnChildController(controller:UIViewController, view:UIView){
        addChildViewController(controller)
        view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    func killChildControllers(){
        for child in childViewControllers {
            child.willMove(toParentViewController: nil)
            child.view.removeFromSuperview()
            child.removeFromParentViewController()
        }
    }
    func getParentOfType<T>(type:T.Type) -> T?{
        guard let parent = parent else {
            return nil
        }
        if let parent = parent as? T {
            return parent
        } else {
            return parent.getParentOfType(type: T.self)
        }
    }
}

extension UIStackView {
    func fitToContent(){
        
        let count = arrangedSubviews.count
        var width = frame.width
        var height = frame.height
        
        if axis == .horizontal {
            width = 0
            for view in arrangedSubviews {
                width += view.intrinsicContentSize.width
            }
            width += count > 1 ? (count - 1) * spacing : 0
        } else {
            height = 0
            for view in arrangedSubviews {
                height += view.intrinsicContentSize.height
            }
            height += count > 1 ? (count - 1) * spacing : 0
        }
        
        let size = CGSize(width: width, height: height)
        frame = CGRect(origin: frame.origin, size: size)
    }
}
