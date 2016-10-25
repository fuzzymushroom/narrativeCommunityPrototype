import Foundation

class Profile {
    
    //MARK: VARIABLES
    var isSelf:Bool = false
    var bgName:String!
    var characterImageName:String!
    var username:String!
    var quote:String!
    var karma:Int = 0
    var chaptersRead:Int = 0
    var followers:Int = 0
    var createdStoryIds:[String]!
    var recommendedStoryIds:[String]!
    var feedDatas:[FeedData]!
    
    //MARK: INITIALIZATION
}
