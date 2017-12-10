import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    let images: [UIImage] = [#imageLiteral(resourceName: "img_1"), #imageLiteral(resourceName: "img_2"), #imageLiteral(resourceName: "img_3"), #imageLiteral(resourceName: "img_4"), #imageLiteral(resourceName: "img_5")]
    var nodes = [UUID: UIImage]()

    @IBOutlet var arView: ARSKView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        let scene = SKScene(size: CGSize(width: 375, height: 500))
        arView.presentScene(scene)
        arView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuaration = ARWorldTrackingConfiguration()
        arView.session.run(configuaration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arView.session.pause()
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
        
        guard let camera = arView.session.currentFrame?.camera
            else { return }

        var translation = matrix_identity_float4x4
        translation.columns.3.z = -1
        let transform = simd_mul(camera.transform, translation)
        let anchor = ARAnchor(transform: transform)
        nodes[anchor.identifier] = images[indexPath.row]
        arView.session.add(anchor: anchor)
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

