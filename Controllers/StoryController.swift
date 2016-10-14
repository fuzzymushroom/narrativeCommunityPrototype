import UIKit

class StoryController: UIViewController {
    
    //MARK: VARIABLES
    let storyView = StoryView()
    let frames = [
        "story1",
        "story2",
        "story3",
        "story4",
        "story5"
    ]
    var frameIndex:Int!
    
    //MARK: OVERRIDES
    override func loadView(){
        super.loadView()
        self.view = storyView
    }
    override func viewDidLoad() {
        goToFrame(index: 0)
        storyView.enableTap(target: self, action: #selector(advanceFrame))
        let masterController = getParentOfType(type: MasterController.self)!
        storyView.exitButton.addTarget(masterController, action: #selector(MasterController.loadPortal), for: .touchUpInside)
    }
    
    //MARK: FUNCTIONS
    func goToFrame(index:Int){
        assert(index < frames.count, "frame index=\(index) out of bounds")
        frameIndex = index
        storyView.showFrame(named: frames[index])
    }
    func advanceFrame(){
        if frameIndex == frames.count - 1 {
            endStory()
        } else {
            goToFrame(index: frameIndex + 1)
        }
    }
    func endStory(){
        let masterController = getParentOfType(type: MasterController.self)!
        masterController.loadPortal()
    }
}
