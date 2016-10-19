import Foundation
import UIKit

class UIViewFromNib:UIView{
    
    //subclasses of this must override getBundleName
    
    init(){
        super.init(frame: .zero)
        let nibView = getViewFromXib()
        frame = nibView.frame
        addSubview(nibView)
        customSetup()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        let nibView = getViewFromXib()
        nibView.frame = frame
        addSubview(nibView)
        customSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let nibView = getViewFromXib()
        nibView.frame = bounds
        addSubview(nibView)
        customSetup()
    }
    private func getViewFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: getNibName(), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        //view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
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
    func enableTap(target: AnyObject, action: Selector){
        isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(gestureRecognizer)
    }
}

extension UIViewController {
    func spawnChildController(controller:UIViewController, view:UIView){
        addChildViewController(controller)
        view.layoutIfNeeded()
        controller.view.frame = CGRect(origin: .zero, size: view.bounds.size)
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
    func getAxisLength() -> CGFloat {

        let count = arrangedSubviews.count
        var length = CGFloat(0)

        for view in arrangedSubviews {
            length += axis == .horizontal ? view.frame.width : view.frame.height
        }
        length += count > 1 ? (count - 1) * spacing : 0
        return length
    }
}

extension UIButton {
    func toggleSelected() -> Bool {
        isSelected = !isSelected
        return isSelected
    }
}
