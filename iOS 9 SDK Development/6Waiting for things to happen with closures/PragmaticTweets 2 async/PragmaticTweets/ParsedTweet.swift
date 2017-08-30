import UIKit

class ParsedTweet: NSObject {
    var tweetText: String?
    var userName:  String?
    var createdAt: String?
    var userAvatarURL: NSURL?

    init(tweetText: String?, userName: String?,createdAt: String?, userAvatarURL: NSURL?) {
        super.init()
        self.tweetText = tweetText
        self.userName = userName
        self.createdAt = createdAt
        self.userAvatarURL = userAvatarURL
    }

    // 为兼容没有参数
    override init() {
        super.init()
    }
}
