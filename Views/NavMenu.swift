import UIKit

class NavMenu:UIView{

    //MARK: VARIABLES
    let navCells = [NavCell]()
    var height = CGFloat(0)
    
    //MARK: METHODS
    func addNavCell(named name:String, image: UIImage, onTap:@escaping VoidClosure){
        let navCell = NavCell()
        navCell.populate(name: name, image: image)
        navCell.setOnTap(onTap: onTap)
        
        navCell.frame.origin = CGPoint(x: 0, y: height)
        addSubview(navCell)
        height += navCell.frame.height
    }
    
    

}
