import UIKit

class SimplePopupController:UIViewController{
    
    //MARK: VARIABLES
    @IBOutlet var imageView: UIImageView!
    private var image:UIImage!
    
    //MARK: INITIALIZATION
    init(image:UIImage){
        let nibName = "SimplePopupLayout"
        super.init(nibName: nibName, bundle: nil)
        self.image = image
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewDidLoad() {
        imageView.image = self.image
        view.enableTap(target: self, action: #selector(close))
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    //MARK: FUNCTIONS
    func close(){
        if let presenter = self.presentingViewController {
            presenter.dismiss(animated: false, completion: nil)
        }
    }
}
