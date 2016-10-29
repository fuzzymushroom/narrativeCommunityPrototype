import UIKit

class Choice:UIViewFromNib {
    
    //MARK: VARIABLES
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var label: UILabel!
    var choices = [(button: ChoiceButton, percent: CGFloat)]()
    
    //MARK: INITIALIZATION
    override func getNibName() -> String{
        return "ChoiceLayout"
    }
    override func customSetup() {
        label.isHidden = true
    }
    
    //MARK: FUNCTIONS
    func addChoice(label:String, percent:CGFloat) -> ChoiceButton {
        let choiceButton = ChoiceButton()
        choiceButton.setLabelTo(label)
        choiceButton.setOnTap {[weak self] in
            self!.fill(choiceButton: choiceButton)
        }
        stackView.addArrangedSubview(choiceButton)
        choices += [(button: choiceButton, percent: percent)]
        return choiceButton
    }
    private func fill(choiceButton:ChoiceButton){
        for choice in choices {
            let button = choice.button
            button.fillTo(isSelected: button == choiceButton, percentage: choice.percent, seconds: 1)
            if button == choiceButton {
                label.text = "\(Int(choice.percent*100))% of other readers chose the same!"
                label.isHidden = false
            }
        }
    }
    func clearChoices(){
        for choice in choices {
            choice.button.isHidden = true
            stackView.removeArrangedSubview(choice.button)
        }
        choices = [(button: ChoiceButton, percent: CGFloat)]()
    }
}
