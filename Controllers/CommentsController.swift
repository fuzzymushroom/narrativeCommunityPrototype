import UIKit

class CommentsController:UIViewController{
    
    //MARK: VARIABLES
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var xButton: UIButton!
    @IBOutlet var stackViewHeight: NSLayoutConstraint!
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: INITIALIZATION
    init(){
        let nibName = "CommentThreadLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        xButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        let comment1 = addComment()
        comment1.populate(mugshot: UIImage(named: "mugshotCass")!, username: "Pink-Haired Cass", comment: "Would that really be doing my mom any favors")
            
        let comment2 = addComment()
        comment2.populate(mugshot: UIImage(named: "mugshotColonelSanders")!, username: "Colonel Sanders", comment: "But what are relationships w/o TRUST?")
    }
    
    //MARK: FUNCTIONS
    func close(){
        if let presenter = self.presentingViewController {
            presenter.dismiss(animated: false, completion: nil)
        }
    }
    func addComment() -> Comment {
        let comment = Comment()
        comment.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: comment.intrinsicContentSize.height * view.bounds.width / comment.intrinsicContentSize.width)
        stackView.addArrangedSubview(comment)
        let axisLength = stackView.getAxisLength()
        stackViewHeight.constant = axisLength
        scrollView.contentSize = CGSize(width: view.bounds.width, height: axisLength)
        return comment
    }    
}
