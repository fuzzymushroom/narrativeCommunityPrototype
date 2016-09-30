import Foundation
import UIKit
import AVFoundation

class ViewControllerPlus:UIViewController{
    
    private var stack = [StackTuple]()
    private var stackLocks = [StackLock:Int]()
    var isLoggingOn = false
    
    //MARK: STACKED CALLS
    
    /* ViewControllerPlus' framework for sequencing multiple blocks of code is to put them onto a stack (last-in first-out). Code that pushes to the stack should be agnostic to what is already on the stack.  Code that gets pushed onto the stack should behave robustly if an arbitrary number of closures get stacked on top of it.
     
     Closures pushed onto the stack are responsible for calling stackPop exactly once to ensure that subsequent stacked calls get executed. There are many ways to do this:
        - call stackPop when the block is done running
        - call some other method that calls stackPop
        - sequence stackPop at the end of an SKAction or UIView animation
        - pass the flow to another object that delegates back to a method that calls stackPop
        - open a game menu, and ensure that all exits from that game menu call stackPop

     To remind developers to adhere to this, stackable functions must return a StackPop object.  This does not amount to hard enforcement, but is a useful reminder.  Even functions that pop the stack without ever being stacked themselves should return StackPop, to remind developers that calling it pops the stack.
     
     A few functions clear the stack instead of popping it.  An example is losing the game.  This is as good as popping the stack, and also returns a StackPop object.
     
     Stack.pop and stackPush both suppress user input by default, on the assumption that it is dangerous to interrupt the stack while it is running.  Attempts to pop the stack while it is empty are interpreted as a sign that code is finished running, and will restore user input.
     
     Sometimes stack execution must be interrupted to let the player make an input.  First suspendStackProgress. This calls allowInput, and prevents the stack from being popped any further.  Then ensure that resumeStackProgress gets called when user input is complete.  This could mean covering every single exit from the "sandbox" of user interaction.  It could also mean assigning unsuspendStack to a button, and letting the player do whatever they want.
     
     */
    
    //MARK: STACK FUNCTIONALITY
    func stackPush(closure:StackClosure, stackKey:StackKey){
        let stackTuple = StackTuple(closure, stackKey, false, nil)
        stackPush(stackTuple)
    }
    func stackPush(stackTuple:StackTuple){
        suppressInput()
        stack.append(stackTuple)
        if isLoggingOn { print("pushed \(stackTuple.stackKey). stack count = \(stack.count)") }
    }
    func stackPop() -> StackPops {
        var lockedCount = 0
        for (_, count) in stackLocks { lockedCount = max(lockedCount, count) }
        guard stack.count > lockedCount else {
            if isLoggingOn { print("stackpop blocked at count \(lockedCount)") }
            allowInput();
            return true
        }
        if let stackTuple = stack.popLast() {
            if isLoggingOn { print("popped \(stackTuple.stackKey). stack count = \(stack.count)") }
            if stackTuple.shouldPause, let name = stackTuple.displayName {
                let newStackTuple = StackTuple(
                    closure: stackTuple.closure,
                    stackKey: stackTuple.stackKey,
                    shouldPause: false,
                    displayName: nil
                )
                stackPushManualStep(newStackTuple, displayName: name)
                allowInput()
                if isLoggingOn { print("activated manual step thru for \(stackTuple.stackKey)") }
                return true
            } else {
                suppressInput()
                return stackTuple.closure()
            }
        }
        return true
    }
    func stackPopWithDelay(delay:NSTimeInterval) -> StackPops {
        performSelector(#selector(stackPop), withObject: nil, afterDelay: delay)
        return true
    }
    func stackClear() -> StackPops {
        stack = [StackTuple]()
        unexposeManualStep()
        stackLocks = [StackLock:Int]()
        allowInput()
        return true
    }
    
    //MARK: MANUAL STEPPING
    func stackPushManualStep(stackTuple:StackTuple, displayName:String){
        stackPush(stackTuple)
        lockStackProgress(.MANUAL_STEPPING)
        exposeManualStepWithName(displayName)
    }
    func stackPopManualStep() -> StackPops{
        unexposeManualStep()
        unlockStackProgress(.MANUAL_STEPPING)
        return stackPop()
    }
    func stackCancelManualStepWithKey(stackKey:StackKey){
        unexposeManualStep()
        unlockStackProgress(.MANUAL_STEPPING)
        guard stack.count > 0 else { return }
        for i in (0...stack.count - 1).reverse() {
            let stackTuple = stack[i]
            if stackTuple.stackKey == stackKey {
                stack.removeAtIndex(i)
            }
        }
    }
    internal func lockStackProgress(stackLock:StackLock){
        stackLocks[stackLock] = stack.count
        if isLoggingOn { print("now locking stackpops beyond count \(stack.count) using key \(stackLock)") }
    }
    internal func unlockStackProgress(stackLock:StackLock) {
        stackLocks.removeValueForKey(stackLock)
        if isLoggingOn { print("stackpops unlocked for key \(stackLock)") }
    }
    internal func exposeManualStepWithName(name:String){}  //override
    internal func unexposeManualStep(){}   //override
    
    //MARK: USER INPUT
    func allowInput(){
        let sharedApplication = UIApplication.sharedApplication()
        if(sharedApplication.isIgnoringInteractionEvents()) {
            sharedApplication.endIgnoringInteractionEvents()
        }
    }
    func suppressInput(){
        let sharedApplication = UIApplication.sharedApplication()
        if(!sharedApplication.isIgnoringInteractionEvents()) {
            sharedApplication.beginIgnoringInteractionEvents()
        }
    }
        
    //MARK: OTHER
    override func addChildViewController(childController: UIViewController) {
        //childController.willMoveToParentViewController(self)
        super.addChildViewController(childController)
        view.addSubview(childController.view)
        childController.didMoveToParentViewController(self)
    }
    
    //MARK: AUDIO
    
    var bgmAudioPlayer:AVAudioPlayer?
    
    func playBgm(fileName:String, fileExtension:String) {
        bgmAudioPlayer?.stop()
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: fileExtension)
        let url = NSURL.fileURLWithPath(path!)
        do {
            try bgmAudioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("could not play background music: " + fileName + "." + fileExtension)
        }
        bgmAudioPlayer?.numberOfLoops = -1
        bgmAudioPlayer?.prepareToPlay()
        bgmAudioPlayer?.play()
    }
}
enum StackKey:Int{
    case EXAMPLE
}
enum StackLock:Int{
    case MANUAL_STEPPING
}


public typealias StackPops = Bool
public typealias StackClosure = () -> StackPops
typealias StackTuple = (closure:StackClosure, stackKey:StackKey, shouldPause:Bool, displayName:String?) //non-nil display name makes a stack tuple eligible for manual stepping
