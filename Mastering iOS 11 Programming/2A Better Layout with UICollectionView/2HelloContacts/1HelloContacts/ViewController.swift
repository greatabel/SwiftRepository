import UIKit
import Contacts

class ViewController: UIViewController , UICollectionViewDataSource,
    UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

   @IBOutlet var collectionView: UICollectionView!

    var contacts = [HCContact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = ContactsCollectionViewLayout()
        
        let store = CNContactStore()
        let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        print("## authorizationStatus = \(authorizationStatus.rawValue)")

        if authorizationStatus == .notDetermined {
            store.requestAccess(for: .contacts, completionHandler: {[weak self] authorized, error in
                if authorized {
                    self?.retrieveContacts(fromStore: store)
                }
            })
        } else if authorizationStatus == .authorized {
            retrieveContacts(fromStore: store)
        }

        navigationItem.rightBarButtonItem = editButtonItem

        let longPressRecognizer = UILongPressGestureRecognizer(target: self,  action: #selector(self.receivedLongPress(gestureRecognizer:)))
        collectionView.addGestureRecognizer(longPressRecognizer)
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)

        for visibleCell in collectionView.visibleCells {
            guard let cell = visibleCell as? ContactCollectionViewCell
                else { continue }

            if editing {
                UIView.animate(withDuration: 0.2, delay: 0, options:
                    [.curveEaseOut], animations: {
                        cell.backgroundColor = UIColor(red: 0.9, green: 0.9,
                                                       blue: 0.9, alpha: 1)
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2, delay: 0, options:
                    [.curveEaseOut], animations: {
                        cell.backgroundColor = .clear
                }, completion: nil)
            }
        }
    }

    @objc func receivedLongPress(gestureRecognizer: UILongPressGestureRecognizer) {

        let tappedPoint = gestureRecognizer.location(in: collectionView)
        guard let tappedIndexPath = collectionView.indexPathForItem(at: tappedPoint),
            let tappedCell = collectionView.cellForItem(at: tappedIndexPath) else { return }

        if isEditing {
            reorderContact(withCell: tappedCell, atIndexPath: tappedIndexPath, gesture: gestureRecognizer)
        } else {
            deleteContact(withCell: tappedCell, atIndexPath: tappedIndexPath)
        }
    }

    func reorderContact(withCell cell: UICollectionViewCell, atIndexPath indexPath: IndexPath, gesture: UILongPressGestureRecognizer){
//        print("gesture.state = \(gesture.state.rawValue)")
        switch(gesture.state) {
        case .began:
            collectionView.beginInteractiveMovementForItem(at: indexPath)
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
                cell.transform = CGAffineTransform(scaleX: 1.1, y:1.1)
            }, completion: nil)
            break
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: collectionView))
            break
        case .ended:
            collectionView.endInteractiveMovement()
            break
        default:
            collectionView.cancelInteractiveMovement()
            break
        }
    }

    func deleteContact(withCell cell: UICollectionViewCell, atIndexPath indexPath: IndexPath) {
        let confirmDialog = UIAlertController(title: "Delete this contact?",
                                              message: "Are you sure you want to delete this contact?",
                                              preferredStyle: .actionSheet)

        let deleteAction = UIAlertAction(title: "Yes", style: .destructive,
                                         handler: { action in
                                            self.contacts.remove(at: indexPath.row)
                                            self.collectionView.deleteItems(at: [indexPath])
        })
        let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)

        confirmDialog.addAction(deleteAction)
        confirmDialog.addAction(cancelAction)

        if let popOver = confirmDialog.popoverPresentationController {
            popOver.sourceView = cell
        }

        present(confirmDialog, animated: true, completion: nil)
    }


    func retrieveContacts(fromStore store: CNContactStore) {
        let containerId = store.defaultContainerIdentifier()


        let predicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)

        let keysToFetch =
            [CNContactGivenNameKey as CNKeyDescriptor,
             CNContactFamilyNameKey as CNKeyDescriptor,
             CNContactImageDataKey as CNKeyDescriptor,
             CNContactImageDataAvailableKey as CNKeyDescriptor]

        contacts = try! store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch).map { contact in
            return HCContact(contact: contact)
        }

        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }


    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            "contactCell", for: indexPath) as! ContactCollectionViewCell
        let contact = contacts[indexPath.row]

        cell.nameLabel.text = "\(contact.givenName) \(contact.familyName)"

        contact.fetchImageIfNeeded()
        if let image = contact.contactImage {
            cell.contactImage.image = image
        }

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: floor((collectionView.bounds.width - 2) / 3), height: 90)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let cellsPerRow: CGFloat = 3
        let widthRemainder = (collectionView.bounds.width -
            (cellsPerRow-1)).truncatingRemainder(dividingBy: cellsPerRow)
            / (cellsPerRow-1)
        return 1 + widthRemainder
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(#function)
        guard let cell = collectionView.cellForItem(at: indexPath) as? ContactCollectionViewCell
            else { return }

        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut], animations: {
            cell.contactImage.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { finished in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseIn], animations: {
                cell.contactImage.transform = CGAffineTransform.identity
            }, completion: nil)
        })
    }



}


