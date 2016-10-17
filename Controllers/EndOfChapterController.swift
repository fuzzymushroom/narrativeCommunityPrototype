import UIKit

class EndOfChapterController:UIViewController{
    
    //MARK: VARIABLES
    @IBOutlet var visitAuthorButton: UIButton!
    @IBOutlet var homeButton: UIButton!
    @IBOutlet var author: UIImageView!
    @IBOutlet var roseButton: UIButton!
    @IBOutlet var followButton: UIButton!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var recommendButton: UIButton!
    
    var animator:UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    var collision:UICollisionBehavior!
    var push:UIPushBehavior!
    
    //MARK: INITIALIZATION
    init(){
        let nibName = "EndOfChapterLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        let storyController = getParentOfType(type: StoryController.self)!
        homeButton.addTarget(storyController, action: #selector(StoryController.goHome), for: .touchUpInside)
        visitAuthorButton.addTarget(storyController, action: #selector(StoryController.goProfile), for: .touchUpInside)
        roseButton.addTarget(self, action: #selector(rose), for: . touchUpInside)
        followButton.addTarget(followButton, action: #selector(UIButton.toggleSelected), for: .touchUpInside)
        favoriteButton.addTarget(favoriteButton, action: #selector(UIButton.toggleSelected), for: .touchUpInside)
        recommendButton.addTarget(recommendButton, action: #selector(UIButton.toggleSelected), for: .touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        followButton.isHidden = true
        favoriteButton.isHidden = true
        recommendButton.isHidden = true
    }
    
    //MARK: FUNCTIONS
    func rose(){
        roseButton.isHidden = true
        followButton.isHidden = false
        favoriteButton.isHidden = false
        recommendButton.isHidden = false
        
        let rose = UIImageView(image: UIImage(named: "iconRose"))
        rose.frame.origin = roseButton.frame.origin
        view.addSubview(rose)
        
        animator = UIDynamicAnimator(referenceView: view)
        collision = UICollisionBehavior(items: [rose])
        collision.translatesReferenceBoundsIntoBoundary = true
        push = UIPushBehavior(items: [rose], mode: .instantaneous)
        push.setAngle(-CGFloat.pi*9/16, magnitude: 2)
        gravity = UIGravityBehavior(items: [rose])
        animator.addBehavior(collision)
        animator.addBehavior(push)
        animator.addBehavior(gravity)
    }
}
