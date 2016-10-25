import Foundation

class GameModel{
    func getProfile(userId:String) -> Profile {
        let profile = Profile()
        switch(userId){
        case "cass":
            profile.isSelf = false
            profile.bgName = "bgCollege"
            profile.characterImageName = "cass"
            profile.username = "Pink-Haired Cass"
            profile.quote = "Allow myself to introduce my... shelf"
            profile.karma = 500
            profile.chaptersRead = 50
            profile.followers = 999
            profile.createdStoryIds = ["campfire", "kawataki"]
            profile.recommendedStoryIds = ["guy","demi","meanGirls","sundosia","bff","sorority"]
            profile.feedDatas = []
        case "max":
            profile.isSelf = true
            profile.bgName = "bgCollege"
            profile.characterImageName = "max"
            profile.username = "Maximoose"
            profile.quote = "Tap the pencil icon to TELL YOUR STORY!"
            profile.karma = 50
            profile.chaptersRead = 999
            profile.followers = 0
            profile.createdStoryIds = []
            profile.recommendedStoryIds = ["campfire"]
            let feedSurvey = FeedData()
            feedSurvey.mugshotName = "mugshotMax"
            feedSurvey.username = "Maximoose"
            feedSurvey.mediaName = "Survey from Campfire Episode 1"
            feedSurvey.date = "Oct 24 2016"
            feedSurvey.imageName = "feedSurvey"
            profile.feedDatas = [feedSurvey]
        default:
            break
        }
        return profile
    }
    func getFeedDatas() -> [FeedData] {
        let feedDataVideo = FeedData()
        feedDataVideo.mugshotName = "mugshotCass"
        feedDataVideo.username = "Pink-Haired Cass"
        feedDataVideo.mediaName = "YouTube Video"
        feedDataVideo.date = "Oct 24 2016"
        feedDataVideo.imageName = "feedVideo"
//        feedDataVideo.imageName = "iconMenu"
        feedDataVideo.showPlayButton = true
        
        let feedRec = FeedData()
        feedRec.mugshotName = "mugshotCass"
        feedRec.username = "Pink-Haired Cass"
        feedRec.mediaName = "Shoutout"
        feedRec.date = "Oct 24 2016"
        feedRec.imageName = "feedMessageRec"
        
        let feedCollab = FeedData()
        feedCollab.mugshotName = "mugshotCass"
        feedCollab.username = "Pink-Haired Cass"
        feedCollab.mediaName = "Shoutout"
        feedCollab.date = "Oct 24 2016"
        feedCollab.imageName = "feedMessageCollaborators"
        
        let feedLink = FeedData()
        feedLink.mugshotName = "mugshotChristine"
        feedLink.username = "Christine@Episode"
        feedLink.mediaName = "Shoutout"
        feedLink.date = "Oct 24 2016"
        feedLink.imageName = "feedLink"
        
        let feedScreenCapture = FeedData()
        feedScreenCapture.mugshotName = "mugshotCass"
        feedScreenCapture.username = "Pink-Haired Cass"
        feedScreenCapture.mediaName = "Screenshot from Old Maid Adventures"
        feedScreenCapture.date = "Oct 24 2016"
        feedScreenCapture.imageName = "feedScreenCapture"
        
        let feedSceneCapture = FeedData()
        feedSceneCapture.mugshotName = "mugshotCass"
        feedSceneCapture.username = "Pink-Haired Cass"
        feedSceneCapture.mediaName = "Scene Capture from Old Maid Adventures"
        feedSceneCapture.date = "Oct 24 2016"
        feedSceneCapture.imageName = "feedSceneCapture"
        feedSceneCapture.showPlayButton = true
        
        let feedShort = FeedData()
        feedShort.mugshotName = "mugshotColonelSanders"
        feedShort.username = "Colonel Sanders"
        feedShort.mediaName = "3-beat Short"
        feedShort.date = "Oct 24 2016"
        feedShort.imageName = "feedShort"
        feedShort.showPlayButton = true
        
        let feedDatas = [feedDataVideo, feedRec, feedCollab, feedLink, feedScreenCapture, feedSceneCapture,feedShort]
        return feedDatas
    }
    func getCommentThread(id:String) -> [CommentData] {
        switch(id){
        case "portal":
            let comment1 = CommentData()
            comment1.mugshotImageName = "mugshotCass"
            comment1.username = "Pink-Haired Cass"
            comment1.comment = "Would that really be doing my mom any favors?"
        
            let comment2 = CommentData()
            comment2.mugshotImageName = "mugshotColonelSanders"
            comment2.username = "Colonel Sanders"
            comment2.comment = "But what are relationships w/o TRUST?"
        
            return [comment1, comment2]
        case "story":
            let comment0 = CommentData()
            comment0.mugshotImageName = "mugshotColonelSanders"
            comment0.username = "Colonel Sanders"
            comment0.comment = "Protect the institution of marriage from robots!"
            
            let comment1 = CommentData()
            comment1.mugshotImageName = "mugshotCass"
            comment1.username = "Pink-Haired Cass"
            comment1.comment = "How sophisticated is this robot?"
            
            let comment1b = CommentData()
            comment1b.mugshotImageName = "mugshotCass"
            comment1b.username = "Pink-Haired Cass"
            comment1b.comment = "What does it mean to be human?"
            
            let comment2 = CommentData()
            comment2.mugshotImageName = "mugshotColonelSanders"
            comment2.username = "Colonel Sanders"
            comment2.comment = "MAKE AMERICA GREAT AGAIN!"
            
            return [comment0, comment1, comment1b, comment2]
        default:
            return []
        }
    }
}
