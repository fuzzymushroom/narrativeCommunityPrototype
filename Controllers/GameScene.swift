import UIKit
import SpriteKit

class GameScene:SKScenePlus {
    
    //MARK: VARIABLES
    
    let background:SKSpriteNode! = SKSpriteNode()
    let avatar:SKSpriteNode! = SKSpriteNode()
    
    static let Z_BACKGROUND = CGFloat(0)
    static let Z_AVATAR = CGFloat(10)
    
    //MARK: INITIALIZERS
    
    override init(){
        super.init()
        postInit()
    }
    override init(size: CGSize) {
        super.init(size: size)
        postInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        postInit()
    }
    private func postInit(){
        background.zPosition = GameScene.Z_BACKGROUND
            background.position = getCenter()
            addChild(background)
        avatar.zPosition = GameScene.Z_AVATAR
            avatar.anchorPoint = CGPoint(x: 0.5, y: 0)
            avatar.position = getCenter().offset(x: 0, y: -200)
            addChild(avatar)
    }
    
    //MARK: GENERAL
    
    func showBackground(imageNamed imageName:String){
        let texture = SKTexture(imageNamed: imageName)
        background.texture = texture
        background.size = texture.size()
    }
    func showAvatar(imageNamed imageName:String){
        let texture = SKTexture(imageNamed: imageName)
        avatar.texture = texture
        avatar.size = texture.size()
    }
}
