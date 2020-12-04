import UIKit

struct defaultsKeys {
    /*
     https://stackoverflow.com/questions/28628225/how-to-save-local-data-in-a-swift-app
     */
    static let keyZero = "zeroStringKey"
    static let keyOne = "firstStringKey"
    static let keyTwo = "secondStringKey"
}

class MemoryViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private var deck: Deck!
    private var selectedIndexes = Array<NSIndexPath>()
    private var numberOfPairs = 0
    private var score = 0
    private let difficulty: Difficulty
    private var which_player = 0
    var mylabel = UILabel()
    var array = [Int]()
    
    init(difficulty: Difficulty, which_player: Int){
            self.difficulty = difficulty
            self.which_player = which_player
            super.init(nibName:nil, bundle: nil)
            print(self.which_player, " player!")
            var mykey = defaultsKeys.keyZero
            switch which_player {
            case 0:
                mykey = defaultsKeys.keyZero
            case 1:
                mykey = defaultsKeys.keyOne
            case 2:
                mykey = defaultsKeys.keyTwo
            default:
                mykey = defaultsKeys.keyZero
            }
            // if storage is empty, it means first time
            let defaults = UserDefaults.standard
            self.array = defaults.array(forKey:mykey)  as? [Int] ?? [Int]()
            print("before save:", array.count, "array count", self.array, "mykey", mykey)
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        print("deint")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        start()
    }
    
    private func start(){
        numberOfPairs = 0
        score = 0
        deck = createDeck(numCards: numCardsNeededDifficulty(difficulty: difficulty))
        
        collectionView.reloadData()
    }
    private func createDeck(numCards: Int) -> Deck{
        let fullDeck = Deck.full().shuffled()
        let halfDeck = fullDeck.deckOfNumberOfCards(num: numCards)
        return (halfDeck + halfDeck).shuffled()
    }
    
}

extension MemoryViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath as IndexPath) as! CardCell
        
        let card = deck[indexPath.row]
        cell.renderCardName(cardImageName: card.description, backImageName: "back")
        
        return cell
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deck.count
    }
    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath as IndexPath) as! CardCell
//
//        let card = deck[indexPath.row]
//        cell.renderCardName(cardImageName: card.description, backImageName: "back")
//
//        return cell
//    }
}

// MARK: UICollectionViewDelegate
extension MemoryViewController: UICollectionViewDelegate {

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // http://stackoverflow.com/questions/30730387/swift-2-0-enumerate-is-unavailable-call-the-enumerate-method-on-the-seq
        
        if selectedIndexes.count == 2 || selectedIndexes.contains(indexPath as NSIndexPath) {
            return
        }
        selectedIndexes.append(indexPath as NSIndexPath)
        
        let cell = collectionView.cellForItem(at: indexPath as IndexPath) as! CardCell
        cell.upturn()
        
        if selectedIndexes.count < 2 {
            return
        }
        
        let card1 = deck[selectedIndexes[0].row]
        let card2 = deck[selectedIndexes[1].row]
        score += 1
        checkIfFinished()
        if card1 == card2 {
            numberOfPairs += 1
            
            removeCards()
        } else {
            
            turnCardsFaceDown()
        }
    }
}

private extension MemoryViewController{
    func checkIfFinished(){
        if numberOfPairs == deck.count / 2 || score == deck.count {
                showFinalPopUp()
        }
    }
    
    func showFinalPopUp() {
        //-----start 12.04
//        let now = Date()
//        let timeInterval:TimeInterval = now.timeIntervalSince1970
//        let timeStamp = Int(timeInterval)
//        print("curent ：\(timeStamp)")

        if self.array.count == 0 {
            
            self.array = [numberOfPairs]
            
        } else {
            self.array.append(numberOfPairs)
        }
        var mykey = defaultsKeys.keyZero
        switch which_player {
        case 0:
            mykey = defaultsKeys.keyZero
        case 1:
            mykey = defaultsKeys.keyOne
        case 2:
            mykey = defaultsKeys.keyTwo
        default:
            mykey = defaultsKeys.keyZero
        }
        //
        let defaults = UserDefaults.standard
        defaults.set(self.array, forKey: mykey)
        print("after save:", self.array.count, "array count", self.array, "mykey", mykey)
        
        //https://stackoverflow.com/questions/25179668/how-to-save-and-read-array-of-array-in-nsuserdefaults-in-swift
        
        //-----end   12.04
        
        let alert = UIAlertController(title: "Great!",
            message: "You won with score: \(numberOfPairs) with \(score) clicks!",
            preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
            return
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func removeCards(){
        execAfter(delay: 1.0) {
            self.removeCardsAtPlaces(places: self.selectedIndexes)
            self.selectedIndexes = Array<NSIndexPath>()
        }

        
        let defaults = UserDefaults.standard
        var showText = "round:\(self.array.count) your score:\(numberOfPairs)"
        switch which_player {
        case 0:
            showText = "round:\(self.array.count) your score:\(numberOfPairs)"
        case 1:
            var other_array = defaults.array(forKey:defaultsKeys.keyTwo)  as? [Int] ?? [Int]()
            if other_array.count > 0 {
                if let last = other_array.last {
                    showText = "round:\(self.array.count) You:Rival=\(numberOfPairs):\(last)"
                }
            }
        case 2:
            var other_array = defaults.array(forKey:defaultsKeys.keyOne)  as? [Int] ?? [Int]()
            if other_array.count > 0 {
                if let last = other_array.last {
                    showText = "round:\(self.array.count) You:Rival=\(numberOfPairs):\(last)"
                }
            }
        default:
            break
        }
        self.mylabel.fadeTransition(0.3)
        self.mylabel.text = showText
    }
    
    func turnCardsFaceDown(){
        execAfter(delay: 2.0) {
            self.downturnCardsAtPlaces(places: self.selectedIndexes)
            self.selectedIndexes = Array<NSIndexPath>()
        }
    }
    
    func removeCardsAtPlaces(places: Array<NSIndexPath>){
        for index in selectedIndexes {
            let cardCell = collectionView.cellForItem(at: index as IndexPath) as! CardCell
            cardCell.remove()
        }
    }
    
    func downturnCardsAtPlaces(places: Array<NSIndexPath>){
        for index in selectedIndexes {
            let cardCell = collectionView.cellForItem(at: index as IndexPath)as! CardCell
            cardCell.downturn()
        }
    }
}

private extension MemoryViewController{
    func sizeDifficulty(difficulty: Difficulty) -> (CGFloat, CGFloat){
        switch difficulty{
        case .Easy:
            return (4,3)
        case .Medium:
            return (6,4)
        case .Hard:
            return (6,5)
            
        }
    }
    
    func numCardsNeededDifficulty(difficulty: Difficulty) -> Int {
        let (columns, rows) = sizeDifficulty(difficulty: difficulty)
        return Int(columns * rows / 2)
    }
    
}

// MARK: setup
private extension MemoryViewController{
    func setup(){
        view.backgroundColor = UIColor.greenSea()
        
        let ratio: CGFloat = 1.452
        let space: CGFloat = 5
        
        let (columns, rows) = sizeDifficulty(difficulty: difficulty)
        let cardHeight: CGFloat = view.frame.height/rows - 2*space
        let cardWidth: CGFloat = cardHeight/ratio
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.itemSize = CGSize(width: cardWidth, height: cardHeight)
        layout.minimumLineSpacing = space
        
        let covWidth = columns*(cardWidth + 2*space)
        let covHeight = rows*(cardHeight + space)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: covWidth, height: covHeight), collectionViewLayout: layout)
        collectionView.center = view.center
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
        collectionView.backgroundColor = UIColor.clear
        
        self.view.addSubview(collectionView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 210, height: 21))
        label.center = CGPoint(x: 100, y: 400)
        label.textAlignment = .center
        
        
        let defaults = UserDefaults.standard
        var showText = "round:\(self.array.count) your score:\(numberOfPairs)"
        switch which_player {
        case 0:
            showText = "round:\(self.array.count) your score:\(numberOfPairs)"
        case 1:
            var other_array = defaults.array(forKey:defaultsKeys.keyTwo)  as? [Int] ?? [Int]()
            if other_array.count > 0 {
                if let last = other_array.last {
                    showText = "round:\(self.array.count) You:Rival=\(numberOfPairs):\(last)"
                }
            }
        case 2:
            var other_array = defaults.array(forKey:defaultsKeys.keyOne)  as? [Int] ?? [Int]()
            if other_array.count > 0 {
                if let last = other_array.last {
                    showText = "round:\(self.array.count) You:Rival=\(numberOfPairs):\(last)"
                }
            }
        default:
            break
        }
        
        label.text = showText
        
        self.mylabel = label
        self.view.addSubview(label)
        
    }
    
}

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}

