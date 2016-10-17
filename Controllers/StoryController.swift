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
        storyView.exitButton.addTarget(self, action: #selector(goProfile), for: .touchUpInside)
    }
    
    //MARK: STORY NAVIGATION
    func goToFrame(index:Int){
        assert(index < frames.count, "frame index=\(index) out of bounds")
        frameIndex = index
        storyView.showFrame(named: frames[index])
    }
    func advanceFrame(){
        if frameIndex == frames.count - 1 {
            openEndOfChapter()
        } else {
            goToFrame(index: frameIndex + 1)
        }
    }
    
    //MARK: END OF CHAPTER
    func openEndOfChapter(){
        killChildControllers()
        let eocc = EndOfChapterController()
        spawnChildController(controller: eocc, view: view)
    }
    
    //MARK: EXIT
    func goHome(){
        let masterController = getParentOfType(type: MasterController.self)!
        masterController.loadPortal(page: .HOME)
    }
    func goProfile(){
        let masterController = getParentOfType(type: MasterController.self)!
        masterController.loadPortal(page: .PROFILE)
    }

}
