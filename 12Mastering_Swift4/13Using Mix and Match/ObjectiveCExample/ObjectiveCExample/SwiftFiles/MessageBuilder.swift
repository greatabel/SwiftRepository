import Foundation

class MessageBuilder: NSObject {

    func getPersonalizedMessage(name: String) -> String {
        let messages = Messages()
        let retMessage = "To: " + name + ", " + messages.getMessage()
        return retMessage;
    }

}
