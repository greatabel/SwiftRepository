import UIKit

class Meal {
    var name: String
    var photo: UIImage?

    init?(name: String, photo: UIImage?) {
        self.name = name
        self.photo = photo

        if name.isEmpty {
            return nil
        }
    }

}
