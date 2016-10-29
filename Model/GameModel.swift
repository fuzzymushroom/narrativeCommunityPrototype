import Foundation

class GameModel{
    func getProfile(userId:String) -> Profile {
        let profile = Profile()
        switch(userId){
        case "marlene":
            profile.isSelf = false
            profile.bgName = "bgCollege"
            profile.characterImageName = "marlene"
            profile.username = "Marlene"
            profile.quote = "Hi I'm the creator of Pretty Little Liars! I love telling a good story."
            profile.karma = 500
            profile.chaptersRead = 50
            profile.roses = 999
            profile.createdStoryIds = ["pll", "kawataki"]
            profile.recommendedStoryIds = ["guy","demi","meanGirls","sundosia","bff","sorority"]
            profile.feedDatas = []
        case "cass":
            profile.isSelf = false
            profile.bgName = "bgCollege"
            profile.characterImageName = "cass"
            profile.username = "Pink-Haired Cass"
            profile.quote = "Allow myself to introduce my... shelf"
            profile.karma = 500
            profile.chaptersRead = 50
            profile.roses = 999
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
            profile.roses = 0
            profile.createdStoryIds = []
            profile.recommendedStoryIds = ["pll"]
            let feedSurvey = FeedData()
            feedSurvey.mugshotName = "mugshotMax"
            feedSurvey.username = "Maximoose"
            feedSurvey.mediaName = "Capture from Campfire Episode 1"
            feedSurvey.date = "Oct 24 2016"
            feedSurvey.imageNames = ["feedSurvey"]
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
        feedDataVideo.imageNames = []
        feedDataVideo.videoId = "83BsxzW_n7c"
        
        let feedRec = FeedData()
        feedRec.mugshotName = "mugshotCass"
        feedRec.username = "Pink-Haired Cass"
        feedRec.mediaName = "Shoutout"
        feedRec.date = "Oct 24 2016"
        feedRec.imageNames = ["feedMessageRec"]
        feedRec.deepLink = .STORY
        
        let feedCollab = FeedData()
        feedCollab.mugshotName = "mugshotCass"
        feedCollab.username = "Pink-Haired Cass"
        feedCollab.mediaName = "Shoutout"
        feedCollab.date = "Oct 24 2016"
        feedCollab.imageNames = ["feedMessageCollaborators"]
        
        let feedLink = FeedData()
        feedLink.mugshotName = "mugshotChristine"
        feedLink.username = "Christine@Episode"
        feedLink.mediaName = "Shoutout"
        feedLink.date = "Oct 24 2016"
        feedLink.imageNames = ["feedLink"]
        
        let feedUser = FeedData()
        feedUser.mugshotName = "mugshotChristine"
        feedUser.username = "Christine@Episode"
        feedUser.mediaName = "Shoutout"
        feedUser.date = "Oct 24 2016"
        feedUser.imageNames = ["feedMessageUser"]
        
        let feedChoiceFun = FeedData()
        feedChoiceFun.mugshotName = "mugshotColonelSanders"
        feedChoiceFun.username = "ColonelSanders"
        feedChoiceFun.mediaName = "Survey"
        feedChoiceFun.date = "Oct 24 2016"
        feedChoiceFun.imageNames = ["feedChoiceFun"]
        feedChoiceFun.choices = [
            (answer: "Humans only!", percentage: CGFloat(0.6)),
            (answer: "I'll try anything once.", percentage: CGFloat(0.4))
        ]
        
        let feedChoiceSerious = FeedData()
        feedChoiceSerious.mugshotName = "mugshotChristine"
        feedChoiceSerious.username = "Christine@Episode"
        feedChoiceSerious.mediaName = "Survey"
        feedChoiceSerious.date = "Oct 24 2016"
        feedChoiceSerious.imageNames = ["feedChoiceSerious"]
        
        let feedScreenCapture = FeedData()
        feedScreenCapture.mugshotName = "mugshotCass"
        feedScreenCapture.username = "Pink-Haired Cass"
        feedScreenCapture.mediaName = "Screenshot from Old Maid Adventures"
        feedScreenCapture.date = "Oct 24 2016"
        feedScreenCapture.imageNames = ["feedScreenCapture"]
        
        let feedSceneCapture = FeedData()
        feedSceneCapture.mugshotName = "mugshotCass"
        feedSceneCapture.username = "Pink-Haired Cass"
        feedSceneCapture.mediaName = "Screenshot from Old Maid Adventures"
        feedSceneCapture.date = "Oct 24 2016"
        feedSceneCapture.imageNames = ["feedSceneCapture"]
        
        let feedShort = FeedData()
        feedShort.mugshotName = "mugshotColonelSanders"
        feedShort.username = "Colonel Sanders"
        feedShort.mediaName = "Capture from The Colonel's Shorts"
        feedShort.date = "Oct 24 2016"
        feedShort.imageNames = ["feedShort0a", "feedShort0b", "feedShort0a", "feedShort0b", "feedShort1a", "feedShort1b", "feedShort1a", "feedShort1b", "feedShort2a", "feedShort2b", "feedShort2a", "feedShort2b", "feedShort3a", "feedShort3b", "feedShort3a", "feedShort3b", "feedShort4a", "feedShort4b", "feedShort4a", "feedShort4b"]
        
        let feedGucci = FeedData()
        feedGucci.mugshotName = "mugshotAngela"
        feedGucci.username = "Angela"
        feedGucci.mediaName = "Profile Update"
        feedGucci.date = "Oct 24 2016"
        feedGucci.imageNames = ["feedGucci"]
        
        let feedDatas = [feedDataVideo, feedRec, feedCollab, feedLink, feedUser, feedChoiceFun, feedChoiceSerious, feedScreenCapture, feedSceneCapture, feedShort, feedGucci]
        return feedDatas
    }
    func getCommentThread(id:String) -> [CommentData] {
        switch(id){
        case "story":
            let comment1 = CommentData()
            comment1.mugshotImageName = "mugshotCass"
            comment1.username = "Pink-Haired Cass"
            comment1.comment = "Would that really be doing my mom any favors?"
        
            let comment2 = CommentData()
            comment2.mugshotImageName = "mugshotColonelSanders"
            comment2.username = "Colonel Sanders"
            comment2.comment = "But what are relationships w/o TRUST?"
        
            return [comment1, comment2]
        case "portal":
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
        case "notInUse":
            let comment0 = CommentData()
            comment0.mugshotImageName = "mugshotMax"
            comment0.username = "Maximoose"
            comment0.comment = "The ability to whine without being judged!"
            
            let comment1 = CommentData()
            comment1.mugshotImageName = "mugshotChristine"
            comment1.username = "Goth Girl"
            comment1.comment = "The power to love again."
            
            let comment2 = CommentData()
            comment2.mugshotImageName = "mugshotColonelSanders"
            comment2.username = "Colonel Sanders"
            comment2.comment = "LASER BEAM EYES!"
            
            return [comment0, comment1, comment2]
        default:
            return []
        }
    }
    func getChoiceDatas() -> [ChoiceData] {
        let choiceData0 = ChoiceData()
        choiceData0.question = "Superhero power?"
        choiceData0.answers = ["Flight", "Invisibility"]
        choiceData0.iconNames = ["choiceFlight", "choiceInvisibility"]
        choiceData0.selectionIndex = -1
        
        let choiceData1 = ChoiceData()
        choiceData1.question = "Bieber?"
        choiceData1.answers = ["Disagreer", "Belieber!"]
        choiceData1.iconNames = ["choiceSad", "choiceStarstruck"]
        choiceData1.selectionIndex = 1
        
        let choiceData2 = ChoiceData()
        choiceData2.question = "How's your crepe?"
        choiceData2.answers = ["Sweet", "Savory"]
        choiceData2.iconNames = ["choiceStrawberry", "choiceHam"]
        choiceData2.selectionIndex = 1
        
        return [choiceData0, choiceData1, choiceData2]
    }
}
