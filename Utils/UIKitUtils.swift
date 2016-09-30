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

