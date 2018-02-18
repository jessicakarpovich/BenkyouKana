//
//  ViewController.swift
//  BenkyouKana
//
//  Created by Jessica Karpovich on 2/11/18.
//  Copyright © 2018 Jessica Karpovich. All rights reserved.
//

import UIKit

class KanaViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var kanaLabel: UILabel!
    @IBOutlet weak var romajiTextField: UITextField!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var correctKanaLabel: UILabel!
    
    // Set a default value
    var dict = [0: ["あ", "a"]]
    
    
    
    // This takes the upper bound, rand between 0 and value-1
    // Pass paramater equal to last int in dict
    var randInt = Int(arc4random_uniform(70))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view controller to be the delegate of the text field
        // This will allow me to handle the user entered text
        romajiTextField.delegate = self
        
        // Pull random int, and use it to get a random kana from dictionary
        kanaLabel.text = dict[randInt]![0]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        /* Don't hide the keyboard, the user needs it
        // Hide the keyboard
        //textField.resignFirstResponder()
        */
        
        // trim whitespace from user input
        let userInput = romajiTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check user input
        if userInput != dict[randInt]![1] {
            
            // If invalid, show x and correct answer
            iconImageView.image = UIImage(named: "redX")
            //correctKanaLabel.text = hiraganaDict[randInt]![1]
            correctKanaLabel.text = dict[randInt]![1]
        }
        else {
            
            // if valid, show checkmark and clear the correctKanaLabel
            //iconImageView.image = UIImage(named: "greenCheck")
            correctKanaLabel.text = ""
            
            reloadContent()
        }
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // use this to get any info you need from text field
    }
    
    
    //MARK: Custom functions
    
    // Reload hiragana content, only call when user enters the right answer
    func reloadContent() {
        // generate new random int
        randInt = Int(arc4random_uniform(70))
        
        // Pull random int, and use it to get a random kana from dictionary
        kanaLabel.text = dict[randInt]![0]
        
        // Clear iconImageView
        iconImageView.image = nil
        
        // Clear romaji text field
        // when incorrect, don't, so user can see what they entered compared to the answer
        romajiTextField.text = ""
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

