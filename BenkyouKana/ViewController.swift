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
    
    
    
    
    
    //MARK: Testing
    let hiraganaDict = [0: ["あ", "a"], 1: ["い", "i"], 2: ["う", "u"], 3: ["え", "e"], 4: ["お", "o"]]
    
    // This takes the upper bound, rand between 0 and value-1
    let randInt = Int(arc4random_uniform(5))
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view controller to be the delegate of the text field
        // This will allow me to handle the user entered text
        romajiTextField.delegate = self
        
        print(hiraganaDict[0]![0])
        
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
            iconImageView.image = UIImage(named: "redX")
            correctKanaLabel.text = hiraganaDict[randInt]![1]
        } else {
            iconImageView.image = UIImage(named: "greenCheck")
            correctKanaLabel.text = ""
        }
        
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // use this to get any info you need from text field
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

