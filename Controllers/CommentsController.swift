import UIKit

class CommentsController:UIViewController{
    
    //MARK: VARIABLES
    let thread:[CommentData]
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var xButton: UIButton!
    @IBOutlet var stackViewHeight: NSLayoutConstraint!
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: INITIALIZATION
    init(thread:[CommentData]){
        self.thread = thread
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
        loadThread()
    }
    
    //MARK: FUNCTIONS
    func loadThread(){
        for commentData in thread {
            let comment = addComment()
            comment.populate(mugshot: UIImage(named: commentData.mugshotImageName)!, username: commentData.username, comment: commentData.comment)
            if commentData.mugshotImageName == "mugshotCass" {
                comment.sparkle()
            }
        }
    }
    func close(){
        if let presenter = self.presentingViewController {
            presenter.dismiss(animated: false, completion: nil)
        }
    }
    private func addComment() -> Comment {
        let comment = Comment()
        comment.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: comment.intrinsicContentSize.height * view.bounds.width / comment.intrinsicContentSize.width)
        stackView.addArrangedSubview(comment)
        let axisLength = stackView.getAxisLength()
        stackViewHeight.constant = axisLength
        scrollView.contentSize = CGSize(width: view.bounds.width, height: axisLength)
        return comment
    }    
}
