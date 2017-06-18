import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {

    var photos = [Photo]()

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "UICollectionViewCell"
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                               for: indexPath)
        return cell }
}
