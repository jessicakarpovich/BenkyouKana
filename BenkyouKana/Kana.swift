//
//  Kana.swift
//  BenkyouKana
//
//  Created by Jessica Karpovich on 2/18/18.
//  Copyright © 2018 Jessica Karpovich. All rights reserved.
//

import UIKit

class Kana {
    
    //MARK: Properties
    
    var name: String
    var numberOfExcercises: Int
    var dict: [Int: [String]]
    
    //MARK: Initialization
    
    init(name: String = "Hiragana", numberOfExercises: Int = 25, dict: [Int: [String]] = [0: ["あ", "a"]]) {
        
        // Initialize stored properties
        self.name = name
        self.numberOfExcercises = numberOfExercises
        self.dict = dict
        
        //Set defaults if values aren't present
        if (name.isEmpty) {
            self.name = "Hiragana";
        }
    }
}
