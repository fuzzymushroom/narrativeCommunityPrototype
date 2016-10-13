import UIKit

class NavMenu:UIViewFromNib{
    
    //MARK: VARIABLES
    @IBOutlet var stackView: UIStackView!
    var isExpanded = false

    override func getNibName() -> String{
        return "NavMenuLayout"
    }
    override func customSetup() {
    }
    
    func addNavCell(navCell:NavCell){
        stackView.addArrangedSubview(navCell)
        navCell.showBorder()
    }
}