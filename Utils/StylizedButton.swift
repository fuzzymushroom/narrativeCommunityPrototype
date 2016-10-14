import UIKit

class StylizedButton:UIButton {
    
    var selectedColor:UIColor?
    var deselectedColor:UIColor?
    
    func showBorder(){
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    func colorSelected(){
        if let selectedColor = selectedColor{
            backgroundColor = selectedColor
        }
    }
    func colorDeselected(){
        if let deselectedColor = deselectedColor{
            backgroundColor = deselectedColor
        }
    }
}
