import UIKit

class ProfilePage:UIViewFromNib {
    
    var activeTab:StylizedButton?
    @IBOutlet var shelfTab: StylizedButton!
    @IBOutlet var postTab: StylizedButton!
    @IBOutlet var viewport: UIView!
    
    static let COLOR_TAB_DESELECTED = UIColor(red: 0.914, green: 0.914, blue: 0.914, alpha: 1)
    static let COLOR_TAB_SELECTED = UIColor(red: 0.867, green: 0.620, blue: 0.184, alpha: 1)
    
    override func getNibName() -> String{
        return "ProfilePageLayout"
    }
    override func customSetup(){
        shelfTab.showBorder()
        shelfTab.deselectedColor = ProfilePage.COLOR_TAB_DESELECTED
        shelfTab.selectedColor = ProfilePage.COLOR_TAB_SELECTED
        postTab.showBorder()
        postTab.deselectedColor = ProfilePage.COLOR_TAB_DESELECTED
        postTab.selectedColor = ProfilePage.COLOR_TAB_SELECTED
    }
    func selectTab(tab:StylizedButton){
        if let activeTab = activeTab{
            activeTab.colorDeselected()
        }
        activeTab = tab
        tab.colorSelected()
    }
}