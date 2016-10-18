import UIKit

class Bubble:UIViewFromNib{
    
    //MARK: VARIABLES
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dialogLabel: UILabel!
    
    //MARK: OVERRIDES
    override func getNibName() -> String{
        return "BubbleLayout"
    }
    override func customSetup() {
    }
    
    //MARK: FUNCTIONS
    func rename(name:String){
        nameLabel.text = name
    }
    func say(quote:String){
        dialogLabel.text = quote
    }
}
