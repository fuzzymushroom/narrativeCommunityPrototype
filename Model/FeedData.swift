import Foundation

class FeedData {
    var mugshotName:String?
    var username:String?
    var mediaName:String?
    var date:String?
    var imageNames:[String]!
    var question:String?
    var choices:[(answer:String, percentage:CGFloat)]?
    var videoId:String?
    var deepLink:DeepLink?
    var showHeader = true
    var showActionBar = true
}
