/*
 
http://www.jianshu.com/p/f99d59837921

*/

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    lazy var imageArray: [String] = {

        var array: [String] = []

        for i in 1...20 {
            array.append("\(i)-1")
        }

        return array
    }()

    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView =  UICollectionView(frame:
                CGRect(x:0, y:100, width:self.view.bounds.width, height:200),
                                               collectionViewLayout: LineLayout())
        collectionView.backgroundColor = UIColor.black
        collectionView.dataSource  = self
        collectionView.delegate = self

        collectionView.register(ImageTextCell.self, forCellWithReuseIdentifier: "ImageTextCell")
        self.view.addSubview(collectionView)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageTextCell", for: indexPath as IndexPath) as! ImageTextCell
        cell.imageStr = self.imageArray[indexPath.item]

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        self.imageArray.remove(at: indexPath.item)

        collectionView.deleteItems(at: [indexPath as IndexPath])
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {


        if collectionView!.collectionViewLayout is LineLayout {
            collectionView!.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: true)
        }else {
            collectionView!.setCollectionViewLayout(LineLayout(), animated: true)
        }

    }

    

}

