import UIKit

class ProfileController:UIViewController{
    
    //MARK: VARIABLES
    let profilePage = ProfilePage()
    
    //MARK: OVERRIDES
    override func viewDidLoad() {
        self.view = profilePage
    }
}