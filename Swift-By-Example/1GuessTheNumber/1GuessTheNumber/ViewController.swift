//
//  ViewController.swift
//  1GuessTheNumber
//
//  Created by 万畅 on 15/8/15.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rangeLbl: UILabel!
    @IBOutlet weak var numberTxtField: UITextField!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var numGuessesLbl: UILabel!
    
    
    private var lowerBound = 0
    private var upperBound = 100
    private var numGuesses = 0
    private var secretNumber = 0
    
    
    @IBAction func onOkPressed(sender: AnyObject) {
        print(numberTxtField.text)
        let number = Int(numberTxtField.text!)
        print("number= \(number)")
        
        if let number = number {
            selectedNumber(number)
        } else {
            let alert = UIAlertController(title: nil, message: "Enter a number", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberTxtField.becomeFirstResponder()
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


private extension ViewController{
    
    enum Comparison{
        case Smaller
        case Greater
        case Equals
    }
    
    func selectedNumber(number: Int){
        switch compareNumber(number, otherNumber: secretNumber){
        case .Equals:
            let alert = UIAlertController(title: nil, message: "You won in \(numGuesses) guesses!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { cmd in
                self.reset()
                self.numberTxtField.text = ""
            }))
            self.presentViewController(alert, animated: true, completion: nil)

        case .Smaller:
            lowerBound = max(lowerBound, number)
            messageLbl.text = "Your last guess was too low"
            numberTxtField.text = ""
            numGuesses++
            renderRange()
            renderNumGuesses()
            
        case .Greater:
            upperBound = min(upperBound, number)
            messageLbl.text = "Your last guess was too high"
            numberTxtField.text = ""
            numGuesses++
            renderRange()
            renderNumGuesses()
            
        }
        
    }
    
    func compareNumber(number: Int,otherNumber: Int) -> Comparison{
        if number < otherNumber{
            return .Smaller
        } else if number > otherNumber{
            return .Greater
        }
        return .Equals
    }
    
    
}

private extension ViewController{
    
    func extractSecretNumber(){
        
        let diff = upperBound - lowerBound
        let randomNumber = Int(arc4random_uniform(UInt32(diff)))
        secretNumber = randomNumber + Int(lowerBound)
        print("## hehe \(secretNumber)")
        
    }
    func renderRange(){
        rangeLbl.text = "\(lowerBound) and \(upperBound)"
    }
    func renderNumGuesses(){
        numGuessesLbl.text = "Number of Guesses: \(numGuesses)"
    }
    func resetData(){
        lowerBound = 0
        upperBound = 100
        numGuesses = 0
        
    }
    func resetMsg(){
        messageLbl.text = ""
    }
    
    func reset(){
        resetData()
        renderRange()
        renderNumGuesses()
        extractSecretNumber()
        resetMsg()
    }
    
    
}
