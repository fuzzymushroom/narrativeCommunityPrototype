import UIKit

class Shelf:UIViewFromNib{
    
    //MARK: VARIABLES
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var stackView: UIStackView!
    
    //MARK: INITIALIZATION
    override func getNibName() -> String{
        return "ShelfLayout"
    }
    override func customSetup() {
        scrollView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
    }
    
    //MARK: FUNCTIONS
    func setTitle(name:String, qty:Int){
        headerLabel.text = name + " (\(qty))"
    }
    func addStory() -> UIImageView {
        let thumb = UIImage(named: "thumbnailCampfire")
        let story = UIImageView(image: thumb)
        stackView.addArrangedSubview(story)
        stackView.fitToContent()
        scrollView.contentSize = stackView.frame.size
        return story
    }
}