//
//  ViewController.swift
//  BenkyouKana
//
//  Created by Jessica Karpovich on 2/11/18.
//  Copyright © 2018 Jessica Karpovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var kanaLabel: UILabel!
    @IBOutlet weak var romajiTextField: UITextField!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var correctKanaLabel: UILabel!
    
    
    
    
    
    //MARK: Hiragana
    let hiraganaDict = [0: ["あ", "a"], 1: ["い", "i"], 2: ["う", "u"], 3: ["え", "e"], 4: ["お", "o"],
                        5: ["", "ka"], 6: ["", "ki"], 7: ["", "ku"], 8: ["", "ke"], 9: ["", "ko"],
                        10: ["さ", "sa"], 11: ["し", "shi"], 12: ["す", "su"], 13: ["せ", "se"], 14: ["そ", "so"],
                        15: ["た", "ta"], 16: ["ち", "chi"], 17: ["つ", "tsu"], 18: ["て", "te"], 19: ["と", "to"],
                        20: ["な", "na"], 21: ["に", "ni"], 22: ["ぬ", "nu"], 23: ["ね", "ne"], 24: ["の", "no"],
                        25: ["は", "ha"], 26: ["ひ", "hi"], 27: ["ふ", "fu"], 28: ["へ", "he"], 29: ["ほ", "ho"],
                        30: ["ま", "ma"], 31: ["み", "mi"], 32: ["む", "mu"], 33: ["め", "me"], 34: ["も", "mo"],
                        35: ["や", "ya"], 36: ["ゆ", "yu"], 37: ["よ", "yo"],
                        38: ["ら", "ra"], 39: ["り", "ri"], 40: ["る", "ru"], 41: ["れ", "re"], 42: ["ろ", "ro"],
                        43: ["わ", "wa"], 44: ["を", "wo"],
                        45: ["ん", "n"],
                        46: ["が", "ga"], 47: ["ぎ", "gi"], 48: ["ぐ", "gu"], 49: ["げ", "ge"], 50: ["ご", "go"],
                        51: ["ざ", "za"], 52: ["じ", "ji"], 53: ["ず", "zu"], 54: ["ぜ", "ze"], 55: ["ぞ", "zo"],
                        56: ["だ", "da"], 57: ["ぢ", "di"], 58: ["づ", "dzu"], 59: ["で", "de"], 60: ["ど", "do"],
                        61: ["ば", "ba"], 62: ["び", "bi"], 63: ["ぶ", "bu"], 64: ["べ", "be"], 65: ["ぼ", "bo"],
                        66: ["ぱ", "pa"], 67: ["ぴ", "pi"], 68: ["ぷ", "pu"], 69: ["ぺ", "pe"], 70: ["ぽ", "po"]]
    
    // This takes the upper bound, rand between 0 and value-1
    // Pass paramater equal to last int in hiraganaDict
    let randInt = Int(arc4random_uniform(70))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view controller to be the delegate of the text field
        // This will allow me to handle the user entered text
        romajiTextField.delegate = self
        
        // Pull random int, and use it to get a random kana from dictionary
        kanaLabel.text = hiraganaDict[randInt]![0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        
        // Check user input
        if romajiTextField.text != hiraganaDict[randInt]![1] {
            
            // If invalid, show x and correct answer
            iconImageView.image = UIImage(named: "redX")
            correctKanaLabel.text = hiraganaDict[randInt]![1]
        }
        else {
            
            // if valid, show checkmark and clear the correctKanaLabel
            iconImageView.image = UIImage(named: "greenCheck")
            correctKanaLabel.text = ""
        }
        
        
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // use this to get any info you need from text field
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

