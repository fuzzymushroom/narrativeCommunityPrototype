import UIKit

class ChoicesController:UIViewController{
    
    //MARK: VARIABLES
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var stackView: UIStackView!
    
    //MARK: INITIALIZATION
    init(){
        let nibName = "ChoicesLayout"
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {

    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    //MARK: FUNCTIONS
    func addChoices(choiceDatas:[ChoiceData]){
        for choiceData in choiceDatas{
            _ = addChoice(choiceData: choiceData)
        }
        view.layoutIfNeeded()
    }
    func addChoice(choiceData: ChoiceData) -> ChoiceCell {
        let choiceCell = ChoiceCell()
        choiceCell.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: choiceCell.bounds.height)
        stackView.addArrangedSubview(choiceCell)
        let axisLength = stackView.getAxisLength()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: axisLength)
        choiceCell.populate(choiceData: choiceData)
        return choiceCell
    }
}
