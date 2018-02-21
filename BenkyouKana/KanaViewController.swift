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
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    @IBOutlet var doneBtn: UIBarButtonItem!
    
    // Set a default value
    var dict = [0: ["あ", "a"]]
    var kana = Kana()
    var randInt = 0;
    var exerciseCounter = 0
    var correctCounter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navbar.barTintColor = UIColor.white
        
        //Hide done button until user completes all exercises
        navbar.topItem?.rightBarButtonItem = nil
        
        // Set title to Hiragana/Katakana Review
        navbar.topItem?.title = kana.name + " Review"
        
        // Set the view controller to be the delegate of the text field
        // This will allow me to handle the user entered text
        romajiTextField.delegate = self
        
        // This takes the upper bound, rand between 0 and value-1
        // Pass paramater equal to last int in dict
        randInt = Int(arc4random_uniform(UInt32(kana.dict.count)))
        
        // Pull random int, and use it to get a random kana from dictionary
        kanaLabel.text = kana.dict[randInt]![0]
        // Add to exercise counter
        exerciseCounter += 1
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
        if userInput != kana.dict[randInt]![1] {
            
            // If invalid, show x and correct answer
            iconImageView.image = UIImage(named: "redX")
            correctKanaLabel.text = kana.dict[randInt]![1]
        }
        else {
            
            // if valid, show checkmark and clear the correctKanaLabel
            //iconImageView.image = UIImage(named: "greenCheck")
            correctKanaLabel.text = ""
            
            // Add to correct counter
            correctCounter += 1
            
            // If not all of the exercises have been completed, load more
            if exerciseCounter < kana.numberOfExercises {
                exerciseCounter += 1
                reloadContent()
                
                // If they have all been completed, show how much the user got right
            } else if exerciseCounter == kana.numberOfExercises {
                navbar.topItem?.title = kana.name + " Review Complete"
                kanaLabel.text = "\(correctCounter)/ \(exerciseCounter)"
                iconImageView.image = UIImage(named: "greenCheck")
                
                // Remove textfield
                romajiTextField.removeFromSuperview()
                navbar.topItem?.leftBarButtonItem = nil
                navbar.topItem?.rightBarButtonItem = doneBtn
            }
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
        randInt = Int(arc4random_uniform(UInt32(kana.dict.count)))
        
        // Pull random int, and use it to get a random kana from dictionary
        kanaLabel.text = kana.dict[randInt]![0]
        
        // Clear iconImageView
        iconImageView.image = nil
        
        // Clear romaji text field
        // when incorrect, don't, so user can see what they entered compared to the answer
        romajiTextField.text = ""
    }
    
    
    //MARK: Actions
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
}

