//
//  ViewController.swift
//  AugmentedRealityGallery
//
//  Created by Donny Wals on 29/07/2017.
//  Copyright © 2017 DonnyWals. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    var images: [UIImage] = [#imageLiteral(resourceName: "img_1"), #imageLiteral(resourceName: "img_2"), #imageLiteral(resourceName: "img_3"), #imageLiteral(resourceName: "img_4"), #imageLiteral(resourceName: "img_5")]
    var nodes = [UUID: UIImage]()
    
    @IBOutlet var arView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let scene = SKScene(size: CGSize(width: 375, height: 500))
        arView.presentScene(scene)
        arView.delegate = self
        
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
        collectionView.dragInteractionEnabled = true

        let dropInteraction = UIDropInteraction(delegate: self)
        arView.addInteraction(dropInteraction)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        arView.session.pause()
    }
    
    func addImageToARView(_ image: UIImage) {
        guard let camera = arView.session.currentFrame?.camera
            else { return }
        
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -1
        let transform = simd_mul(camera.transform, translation)
        let anchor = ARAnchor(transform: transform)
        nodes[anchor.identifier] = image
        arView.session.add(anchor: anchor)
    }
}

extension ViewController: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let image = images[indexPath.row]
        let itemProvider = NSItemProvider(object: image)
        
        return [UIDragItem(itemProvider: itemProvider)]
    }
}

extension ViewController: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        
        if session.localDragSession != nil {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        
        return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
    }
    
    func performCopy(forCollectionView collectionView: UICollectionView, with coordinator: UICollectionViewDropCoordinator) {
        let destinationIndexPath = coordinator.destinationIndexPath ?? IndexPath(item: 0, section: 0)
        
        for item in coordinator.items {
            let dragItem = item.dragItem
            guard dragItem.itemProvider.canLoadObject(ofClass: UIImage.self) else { continue }
            
            let placeholder = UICollectionViewDropPlaceholder(insertionIndexPath: destinationIndexPath, reuseIdentifier: "GalleryCollectionItem")
            let placeholderContext = coordinator.drop(dragItem, to: placeholder)
            
            dragItem.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] item, error in
                DispatchQueue.main.async {
                    guard let image = item as? UIImage else {
                        placeholderContext.deletePlaceholder()
                        return
                    }
                    
                    placeholderContext.commitInsertion { indexPath in
                        self?.images.insert(image, at: indexPath.row)
                    }
                }
            }
        }
    }
    
    func performMove(forCollectionView collectionView: UICollectionView, with coordinator: UICollectionViewDropCoordinator) {
        let destinationIndexPath = coordinator.destinationIndexPath ?? IndexPath(item: 0, section: 0)
        
        guard let item = coordinator.items.first,
            let sourceIndexPath = item.sourceIndexPath
            else { return }
        
        let image = images.remove(at: sourceIndexPath.row)
        images.insert(image, at: destinationIndexPath.row)
        
        collectionView.performBatchUpdates({
            collectionView.deleteItems(at: [sourceIndexPath])
            collectionView.insertItems(at: [destinationIndexPath])
        })
        
        coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        switch coordinator.proposal.operation {
        case .copy:
            performCopy(forCollectionView: collectionView, with: coordinator)
        case .move:
            performMove(forCollectionView: collectionView, with: coordinator)
        default:
            return
        }
    }
}

extension ViewController: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        guard let itemProvider = session.items.first?.itemProvider,
            itemProvider.canLoadObject(ofClass: UIImage.self)
            else { return }
        
        itemProvider.loadObject(ofClass: UIImage.self) { [weak self] item ,error in
            guard let image = item as? UIImage
                else { return }
            
            DispatchQueue.main.async {
                self?.addImageToARView(image)
            }
        }
    }
}

extension ViewController: ARSKViewDelegate {
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        guard let image = nodes[anchor.identifier]
            else { return nil }
        let texture = SKTexture(image: image)
        let scale = min(100 / image.size.width, 100 / image.size.height)
        let sprite = SKSpriteNode(texture: texture, size: CGSize(width: image.size.width * scale, height: image.size.height * scale))
        
        return sprite
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        addImageToARView(images[indexPath.row])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionItem", for: indexPath)
        
        if let imageCell = cell as? GalleryCollectionItem {
            imageCell.imageView.image = images[indexPath.row]
        }
        
        return cell
    }
}

