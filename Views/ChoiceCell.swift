import UIKit

class ChoiceCell:UIViewFromNib{
    
    //MARK: VARIABLES
    @IBOutlet var questionLabel: UITextField!
    @IBOutlet var button0: StylizedButton!
    @IBOutlet var button1: StylizedButton!
    
    static let COLOR_DESELECTED = UIColor(red: 0.914, green: 0.914, blue: 0.914, alpha: 1)
    static let COLOR_SELECTED = UIColor(red: 0.0, green: 0.75, blue: 0.541, alpha: 1)
    
    override public var intrinsicContentSize:CGSize{
        get {
            return CGSize(width: bounds.width, height: 100.0)
        }
    }
    
    //MARK: INITIALIZATION
    override func getNibName() -> String{
        return "ChoiceCellLayout"
    }
    
    override func customSetup() {
        for button in [button0, button1]{
            button!.deselectedColor = ChoiceCell.COLOR_DESELECTED
            button!.selectedColor = ChoiceCell.COLOR_SELECTED
            button!.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        }
    }
    func populate(choiceData:ChoiceData){
        questionLabel.text = choiceData.question
        
        let title0 = choiceData.answers[0]
        let image0 = UIImage(named: choiceData.iconNames[0])!
        button0.setTitle(title0, for: .normal)
        button0.setTitle(title0, for: .selected)
        button0.setImage(image0, for: .normal)
        button0.setImage(image0, for: .selected)

        let title1 = choiceData.answers[1]
        let image1 = UIImage(named: choiceData.iconNames[1])!
        button1.setTitle(title1, for: .normal)
        button1.setTitle(title1, for: .selected)
        button1.setImage(image1, for: .normal)
        button1.setImage(image1, for: .selected)
        
        if choiceData.selectionIndex == 0 {
            button0.isSelected = true
            button0.colorSelected()
        } else if choiceData.selectionIndex == 1 {
            button1.isSelected = true
            button1.colorSelected()
        }
    }
    
    //MARK: FUNCTIONS
    func toggle(){
        button0.isSelected = !button0.isSelected
        button0.isSelected ? button0.colorSelected() : button0.colorDeselected()
        button1.isSelected = !button0.isSelected
        !button0.isSelected ? button1.colorSelected() : button1.colorDeselected()
    }
}
