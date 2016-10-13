import UIKit

class MyShelfPage:UIViewFromNib {
    
    //MARK: VARIABLES
    @IBOutlet var shortScene: ShortScene!
    @IBOutlet var credBar: CredBar!
    @IBOutlet var shelfContainer: UIScrollView!
    private var shelfStack = UIStackView()
    
    //MARK: INITIALIZATION
    override func getNibName() -> String{
        return "MyShelfLayout"
    }
    override func customSetup(){
        shelfStack.axis = .Vertical
        shelfContainer.addSubview(shelfStack)
    }
    
    //MARK: FUNCTIONS
    func addShelf(shelf:Shelf){
        shelfStack.addArrangedSubview(shelf)
        shelfStack.frame = CGRect(x: 0, y: 0, width: shelfContainer.frame.width, height: shelfStack.frame.height + shelf.intrinsicContentSize().height) /* hack, could not find any way to avoid this */
    }
}