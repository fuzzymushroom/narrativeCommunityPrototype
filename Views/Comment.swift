import UIKit
import SpriteKit

class Comment:UIViewFromNib{
    
    //MARK: VARIABLES
    
    @IBOutlet var mugshot: UIImageView!
    @IBOutlet var sparkleContainer: UIView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    //MARK: OVERRIDES
    override public var intrinsicContentSize:CGSize{
        get {
            return frame.size
        }
    }
    override func getNibName() -> String{
        return "CommentLayout"
    }
    override func customSetup() {
    }
    
    //MARK: FUNCTIONS
    func populate(mugshot:UIImage, username:String, comment:String){
        self.mugshot.image = mugshot
        usernameLabel.text = username
        commentLabel.text = comment
    }
    func sparkle(){
        layoutIfNeeded()
        let skView = SKView(frame: sparkleContainer.bounds)
        sparkleContainer.addSubview(skView)
        
        
        let scene = SKScene(size: skView.frame.size)
        scene.scaleMode = .resizeFill
        skView.allowsTransparency = true
        scene.backgroundColor = .clear
        skView.presentScene(scene)
        
        let sparkler = SKEmitterNode(fileNamed: "Sparkle")!
        sparkler.position = scene.getCenter()
        scene.addChild(sparkler)
    }
}
