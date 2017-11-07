import UIKit
import Contacts

class HCConact {

    private let contact: CNContact
    var contactImage: UIImage?

    var givenName: String {
        return contact.givenName
    }

    var familyName: String {
        return contact.familyName
    }

    init(contact: CNContact) {
        self.contact = contact
    }

    func fetchImageIfNeeded() {
        if let imageData = contact.imageData, contactImage == nil {
            contactImage = UIImage(data: imageData)
        }
    }
}
