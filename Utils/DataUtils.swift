import Foundation
import CoreGraphics

class DataUtils {
    
    static func getDictionaryFromResource(resourceName:String, ofType type: String) -> NSDictionary? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: type) else{
            print ("no resource named " + resourceName + "." + type)
            return nil
        }
        guard let dictionary = NSDictionary(contentsOfFile: path) else{
            print("contents of " + resourceName + "." + type + " not a dictionary")
            return nil
        }
        return dictionary
    }
}

public typealias VoidClosure = (Void) -> Void

extension CGPoint {
    func offset(x:CGFloat, y:CGFloat) -> CGPoint{
        return CGPoint(x: self.x + x, y: self.y + y)
    }
}
func +(left:CGFloat, right:Int) -> CGFloat {
    return left + CGFloat(right)
}
func +(left:Int, right:CGFloat) -> CGFloat {
    return CGFloat(left) + right
}
func -(left:CGFloat, right:Int) -> CGFloat {
    return left - CGFloat(right)
}
func -(left:Int, right:CGFloat) -> CGFloat {
    return CGFloat(left) - right
}
func *(left:CGFloat, right:Int) -> CGFloat {
    return left * CGFloat(right)
}
func *(left:Int, right:CGFloat) -> CGFloat {
    return CGFloat(left) * right
}
func /(left:CGFloat, right:Int) -> CGFloat {
    return left / CGFloat(right)
}
func /(left:Int, right:CGFloat) -> CGFloat {
    return CGFloat(left) / right
}

func /(left:Int, right:Int) -> Double{
    return Double(left)/Double(right)
}
func arc4random_uniform(n:Int) -> Int{
  return Int(arc4random_uniform(UInt32(n)))
}
