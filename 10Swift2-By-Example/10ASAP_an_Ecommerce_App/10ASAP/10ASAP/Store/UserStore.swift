import Foundation

typealias Email = String

class UserStore {
    private struct Constants {
        static let emailKey = "emailKey"
    }

    func setUserEmail(email: Email) {
        UserDefaults.standard.set(email, forKey: Constants.emailKey)
    }

    func userEmail() -> Email? {
        return  UserDefaults.standard.object(forKey: Constants.emailKey) as? Email
    }

    func isUserSignedIn() -> Bool {
        return userEmail() != nil
    }
}

