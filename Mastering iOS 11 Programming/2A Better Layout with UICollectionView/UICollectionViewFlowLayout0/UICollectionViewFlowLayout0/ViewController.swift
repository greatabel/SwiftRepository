import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageTextCell", for: indexPath as IndexPath) as! ImageTextCell
        cell.imageStr = self.imageArray[indexPath.item]

        return cell
    }


    lazy var imageArray: [String] = {

        var array: [String] = []

        for i in 1...20 {
            array.append("\(i)-1")
        }

        return array
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let collectionView =  UICollectionView(frame:
                CGRect(x:0, y:100, width:self.view.bounds.width, height:200),
                                               collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.black
        collectionView.dataSource  = self
        collectionView.delegate = self

        collectionView.register(ImageTextCell.self, forCellWithReuseIdentifier: "ImageTextCell")
        self.view.addSubview(collectionView)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count;
    }



}

class ImageTextCell: UICollectionViewCell {

    var imageView: UIImageView?
    var imageStr: String? {

        didSet {
            self.imageView!.image = UIImage(named: self.imageStr!)
        }

    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.imageView = UIImageView()
        self.addSubview(self.imageView!)

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = self.bounds
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


