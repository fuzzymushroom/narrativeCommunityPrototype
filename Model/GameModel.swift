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
            profile.postImageNames = ["feedMovie", "feedSurvey", "feedRecommendation", "feedCapture"]
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
            profile.postImageNames = ["feedSurvey2"]
        default:
            break
        }
        return profile
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
