import Foundation
import SpriteKit

class SKScenePlus:SKScene {
    
    //this makes nodes that are hidden, alpha'd out, or set to userInteraction set to false tap-thru
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let node = getForemostInteractiveNodeAtTouches(touches: touches)
        node?.touchesBegan(touches, with: event)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let node = getForemostInteractiveNodeAtTouches(touches: touches)
        node?.touchesEnded(touches, with: event)
    }
    override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        let node = getForemostInteractiveNodeAtTouches(touches: touches)
        node?.touchesCancelled(touches!, with: event)
    }
    func getForemostInteractiveNodeAtTouches(touches: Set<UITouch>?) -> SKNode? {
        guard let touch = touches?.first else { return nil }
        let touchLocation = touch.location(in: self)
        return getHighestNodeAtLocation(location: touchLocation, interactiveNodesOnly: true, filterForClasses: nil)
    }
}
