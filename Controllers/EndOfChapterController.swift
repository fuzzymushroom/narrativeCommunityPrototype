import UIKit

class EndOfChapterController:UIViewController{
    
    //MARK: VARIABLES
    @IBOutlet var author: UIImageView!
    @IBOutlet var roseButton: UIButton!
    @IBOutlet var followButton: UIButton!
    @IBOutlet var roseCountLabel: UILabel!
    @IBOutlet var favButton: UIButton!
    
    var animator:UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    var collision:UICollisionBehavior!
    var push:UIPushBehavior!
    var didAlreadyRose = false
    
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
        favButton.addTarget(storyController, action: #selector(StoryController.goHome), for: .touchUpInside)
        roseButton.addTarget(self, action: #selector(toggleRose), for: . touchUpInside)
        followButton.addTarget(followButton, action: #selector(UIButton.toggleSelected), for: .touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        roseCountLabel.isHidden = true
    }
    
    //MARK: FUNCTIONS
    func toggleRose(){
        if roseButton.isSelected == false {
            roseButton.isSelected = true
            if !didAlreadyRose { firstTimeRose() }
        } else {
            roseButton.isSelected = false
        }
    }
    func firstTimeRose(){
        roseCountLabel.isHidden = false
        didAlreadyRose = true
        
        let rose = UIImageView(image: UIImage(named: "iconRose"))
        rose.frame.origin = view.convert(roseButton.frame.origin, from: roseButton.superview!)
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
