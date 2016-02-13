import UIKit

class Meal {
    var name: String
    var photo: UIImage?
    var birthday: String

    init?(name: String,birthday: String, photo: UIImage?) {
        self.name = name
        self.photo = photo
        self.birthday = birthday

        if name.isEmpty {
            return nil
        }
    }

}
