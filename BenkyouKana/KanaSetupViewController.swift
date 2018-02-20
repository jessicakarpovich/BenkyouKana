//
//  KanaSetupViewController.swift
//  BenkyouKana
//
//  Created by Jessica Karpovich on 2/18/18.
//  Copyright © 2018 Jessica Karpovich. All rights reserved.
//

import UIKit

class KanaSetupViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: Properties
    @IBOutlet weak var hiraganaButton: UIButton!
    @IBOutlet weak var katakanaButton: UIButton!
    @IBOutlet weak var excercisesTextField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    var kana = Kana(name: "Hiragana", numberOfExercises: 25, dict: [0: ["あ", "a"]])
    var pickerData: [String] = [String]()
    var pickerSelection = "A-N"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field's user input
        self.excercisesTextField.delegate = self
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["A-N", "Ga-Po", "Kya-Pyo", "A-N and Ga-Po", "A-N and Kya-Pyo",
                      "Ga-Po and Kya-Pyo", "Full Set"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if excercisesTextField.text != "" {
            kana.numberOfExcercises = Int(excercisesTextField.text!)!
        }
    }
    
    
    
    //MARK: UIPickerViewDelegate, UIPickerViewDataSource
    // The number of columns of data in picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's passed in
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Triggered when user makes a change to the picker selection.
        // row and component represent what was selected
        
        pickerSelection = pickerData[row]
        print(pickerSelection)
    }
    
    
    
    //MARK: Actions
    
    // When Hiragana btn is clicked
    @IBAction func hiraganaBtn(_ sender: UIButton) {
        // Remove border from katakana button
        katakanaButton.layer.borderWidth = 0
        
        // Add border width and color to the button that was clicked
        sender.layer.borderWidth = 3
        sender.layer.borderColor = UIColor(red:0.67, green:0.04, blue:0.39, alpha:1.0).cgColor
        
        // Set the name to equal the name of the button
        kana.name = "Hiragana"
    }
    
    // When katakana button is clicked
    @IBAction func katakanaBtn(_ sender: UIButton) {
        // Remove border from hiragana button
        hiraganaButton.layer.borderWidth = 0
        
        // Add border width and color to the button that was clicked
        sender.layer.borderWidth = 3
        sender.layer.borderColor = UIColor(red:0.67, green:0.04, blue:0.39, alpha:1.0).cgColor
        
        // Set the name to equal the name of the button
        kana.name = "Katakana"
    }
    
    
    
    // MARK: - Navigation
     @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
     }
     /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
