import Foundation
import SpriteKit

class SKScenePlus:SKScene {
    
    //this makes nodes that are hidden, alpha'd out, or set to userInteraction set to false tap-thru
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let node = getForemostInteractiveNodeAtTouches(touches)
        node?.touchesBegan(touches, withEvent: event)
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let node = getForemostInteractiveNodeAtTouches(touches)
        node?.touchesEnded(touches, withEvent: event)
    }
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        let node = getForemostInteractiveNodeAtTouches(touches)
        node?.touchesCancelled(touches, withEvent: event)
    }
    func getForemostInteractiveNodeAtTouches(touches: Set<UITouch>?) -> SKNode? {
        guard let touch = touches?.first else { return nil }
        let touchLocation = touch.locationInNode(self)
        return getHighestNodeAtLocation(touchLocation, interactiveNodesOnly: true, filterForClasses: nil)
    }
}
