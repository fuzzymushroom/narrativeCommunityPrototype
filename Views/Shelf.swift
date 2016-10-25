import UIKit

class Shelf:UIViewFromNib{
    
    //MARK: VARIABLES
    @IBOutlet var view: UIView!
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var stackView: UIStackView!
    
    //MARK: INITIALIZATION
    override func getNibName() -> String {
        return "ShelfLayout"
    }
    override func customSetup() {
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    //MARK: FUNCTIONS
    func setTitle(name:String, qty:Int){
        headerLabel.text = name + " (\(qty))"
    }
    func addStory(storyId:String) -> UIImageView {
        let thumb = UIImage(named: "\(storyId)_thumbnail")
        let story = UIImageView(image: thumb)
        stackView.addArrangedSubview(story)
        scrollView.contentSize = CGSize(width: stackView.getAxisLength(), height: stackView.frame.height)
        return story
    }
}
