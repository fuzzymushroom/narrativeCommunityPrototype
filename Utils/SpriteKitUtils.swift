import Foundation
import SpriteKit

class SpriteKitUtils {

    static func getXScreenMoveAction(fromPosition: CGPoint, toPosition: CGPoint, frameWidth:CGFloat, duration:NSTimeInterval) -> SKAction{
        let toX = abs(toPosition.x - fromPosition.x) > frameWidth / 2 ? toPosition.x + (toPosition.x > fromPosition.x ? -1 : 1) * frameWidth : toPosition.x
        return SKAction.customActionWithDuration(duration, actionBlock: {(node:SKNode, elapsedTime:CGFloat) -> Void in
            let t = elapsedTime / CGFloat(duration)
            node.position = CGPoint(x: ((fromPosition.x + t*(toX - fromPosition.x)) + frameWidth) % frameWidth, y: fromPosition.y + t*(toPosition.y - fromPosition.y))
        })
    }
}

class SKButton:SKNode{
    
    var callback:VoidClosure? //set this to make the button do stuff on touchEnd
    var tooltip:SKMultilineLabel? //set this to show a tooltip on hold
    static let HOLD_SENSITIVITY:NSTimeInterval = 0.5
    static let Z_BUMP_TOOLTIP = CGFloat(10)
    static let TOOLTIP_DISPLACEMENT_FROM_FINGER = CGFloat(50)
    
    convenience init(imageNamed:String){
        self.init()
        let sprite = SKSpriteNode(imageNamed: imageNamed)
        addChild(sprite)
    }
    func showTooltip(){
        if let tooltip = self.tooltip {
            addChild(tooltip)
            if let scene = self.scene {
                let width = tooltip.calculateAccumulatedFrame().width
                let height = tooltip.calculateAccumulatedFrame().height
                let position = convertPoint(.zero, toNode: scene)
                let x = (width/2.0 + SKButton.TOOLTIP_DISPLACEMENT_FROM_FINGER) * (scene.frame.width - position.x < width + SKButton.TOOLTIP_DISPLACEMENT_FROM_FINGER ? -1.0 : 1.0)
                let y = scene.frame.height - position.y < height + SKButton.TOOLTIP_DISPLACEMENT_FROM_FINGER ? -SKButton.TOOLTIP_DISPLACEMENT_FROM_FINGER : height + SKButton.TOOLTIP_DISPLACEMENT_FROM_FINGER
                tooltip.position = CGPoint(x: x, y: y)
            }
            tooltip.zPosition = SKButton.Z_BUMP_TOOLTIP
        }
    }
    func hideTooltip(){
        tooltip?.removeFromParent()
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard tooltip != nil else { return }
        let sequence = SKAction.sequence([
            SKAction.waitForDuration(SKButton.HOLD_SENSITIVITY),
            SKAction.runBlock({ self.showTooltip() })
        ])
        runAction(sequence, withKey: "HOLD_COUNTDOWN")
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if tooltip == nil || actionForKey("HOLD_COUNTDOWN") != nil {
            removeActionForKey("HOLD_COUNTDOWN")
            if let point = touches.first?.locationInNode(self.parent!){
                if(self.calculateAccumulatedFrame().contains(point) && callback != nil){
                    callback!()
                }
            }
        } else {
            hideTooltip()
        }
    }
}

class SKHoldToggle:SKNode{
    var onHold:VoidClosure?
    var onRelease:VoidClosure?
    
    convenience init(imageNamed:String, onHold:VoidClosure?, onRelease:VoidClosure?){
        self.init()
        let sprite = SKSpriteNode(imageNamed: imageNamed)
        addChild(sprite)
        self.onHold = onHold
        self.onRelease = onRelease
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        onHold?()
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        onRelease?()
    }
    
}

extension SKScene {
    func getCenter() -> CGPoint{
        return CGPoint(x: size.width/2, y: size.height/2)
    }
    func getHighestNodeAtLocation(location:CGPoint, interactiveNodesOnly:Bool, filterForClasses classNames: [String]?) -> SKNode? {
        let nodes = nodesAtPoint(location)
        var targetNode:SKNode?
        
        for node in nodes{
            if((!interactiveNodesOnly || node.userInteractionEnabled) &&
                !node.hidden && node.alpha > 0 &&
                (classNames == nil || classNames!.indexOf(String(node.dynamicType)) != nil)){
                
                if(targetNode == nil) { targetNode = node }
                else if(node.getTotalZPosition() > targetNode!.getTotalZPosition()) { targetNode = node } //it gets verbose tiebreaking among identical z-positions. just make sure overlapping interactive elements don't have the same z-position.
            }
        }
        return targetNode
    }
}

extension SKNode {
    func copyNodesFromScene(fileNamed:String){
        guard let scene = SKScene(fileNamed: fileNamed) else {
            fatalError("could not copy nodes from " + fileNamed + ".sks")
        }
        for childNode in scene.children {
            addChild(childNode.copy() as! SKNode)
        }
    }
    func swapInNode(node:SKNode, forPlaceholderNamed name:String) -> SKNode{
        let placeholder = childNodeWithName(name)!
        node.position = placeholder.position
        node.zPosition = placeholder.zPosition
        addChild(node)
        placeholder.removeFromParent()
        return placeholder
    }
    func getTotalZPosition() -> CGFloat {
        return getZPositionRelativeToAncestor(self.scene!)
    }
    func getZPositionRelativeToAncestor(ancestor:SKNode) -> CGFloat {
        var z = CGFloat(0)
        var node = self
        
        while(node != ancestor){
            guard let parent = node.parent else { fatalError("node is not a descendant of ancestor") }
            z += node.zPosition
            node = parent
        }
        return z
    }
    func offsetBy(x x:CGFloat, y:CGFloat){
        position = position.offset(x: x, y:y)
    }
    func playVfx(fileNamed:String, duration: NSTimeInterval) -> SKEmitterNode {
        let vfx = SKEmitterNode(fileNamed: fileNamed)!
        addChild(vfx)
        let sequenceAction = SKAction.sequence([
            SKAction.waitForDuration(duration),
            SKAction.runBlock({ vfx.removeFromParent() })
        ])
        runAction(sequenceAction)
        return vfx
    }
}

typealias TextStyle = (fontName:String, fontSize:CGFloat, fontColor:UIColor, leading:Int, alignment:SKLabelHorizontalAlignmentMode)
typealias ShapeStyle = (fillColor:UIColor, strokeColor:UIColor, strokeWidth:CGFloat)
