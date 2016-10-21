import UIKit

class ShortController:UIViewController {
    
    //MARK: VARIABLES
    var character:UIImageView!
    let bubble = Bubble()
    
    @IBOutlet var editButton: UIImageView!
    
    //MARK: INITIALIZATION
    init(){
        let nibName = "ShortSceneLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: FUNCTIONS
    func spawnCharacter(fileName:String, atLocation location:Location) {
        character = UIImageView(image: UIImage(named: fileName))
        character.frame.origin = getPoint(location: location)
        view.addSubview(character)
    }
    func walkToThenSpeak(location:Location, name:String, quote:String) {
        assert(character != nil, "spawn a character before walking")
        UIView.animate(
            withDuration: 1.0,
            animations: { self.character.frame.origin = self.getPoint(location: location) },
            completion: { finished in self.say(name: name, quote: quote) }
        )
    }
    private func getPoint(location:Location) -> CGPoint {
        let Y_CEILING = CGFloat(140.0)
        switch(location){
            case .STAGE_RIGHT: return CGPoint(x: view.bounds.width, y: Y_CEILING)
            case .RIGHT_ISH: return CGPoint(x: view.bounds.width - 140, y: Y_CEILING)
        }
    }
    func say(name:String, quote:String){
        bubble.removeFromSuperview()
        bubble.frame.origin = CGPoint(x: 17, y: 200)
        bubble.rename(name: name)
        bubble.say(quote: quote)
        view.addSubview(bubble)
    }
}
enum Location {
    case STAGE_RIGHT
    case RIGHT_ISH
}
