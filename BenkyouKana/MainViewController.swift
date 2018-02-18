//
//  MainViewController.swift
//  BenkyouKana
//
//  Created by Jessica Karpovich on 2/18/18.
//  Copyright © 2018 Jessica Karpovich. All rights reserved.
//

import UIKit
import os.log


class MainViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
            
        // Hiragana
        case "showHiragana":
            guard let hiraganaViewController = segue.destination as? KanaViewController
                else {
                    fatalError("Uexpected destination \(segue.destination)")
            }
            
            let hiraganaDict = [0: ["あ", "a"], 1: ["い", "i"], 2: ["う", "u"], 3: ["え", "e"], 4: ["お", "o"],
                                5: ["か", "ka"], 6: ["き", "ki"], 7: ["く", "ku"], 8: ["け", "ke"], 9: ["こ", "ko"],
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
            
            hiraganaViewController.dict = hiraganaDict
            
        case "showKatakana":
            guard let katakanaViewController = segue.destination as? KanaViewController
                else {
                    fatalError("Unexpected destination \(segue.destination)")
            }
            
            let katakanaDict = [0: ["ア", "a"], 1: ["イ", "i"], 2: ["ウ", "u"], 3: ["エ", "e"], 4: ["オ", "o"],
                                5: ["カ", "ka"], 6: ["キ", "ki"], 7: ["ク", "ku"], 8: ["ケ", "ke"], 9: ["コ", "ko"],
                                10: ["サ", "sa"], 11: ["シ", "shi"], 12: ["ス", "su"], 13: ["セ", "se"], 14: ["ソ", "so"],
                                15: ["タ", "ta"], 16: ["チ", "chi"], 17: ["ツ", "tsu"], 18: ["テ", "te"], 19: ["ト", "to"],
                                20: ["ナ", "na"], 21: ["ニ", "ni"], 22: ["ヌ", "nu"], 23: ["ネ", "ne"], 24: ["ノ", "no"],
                                25: ["ハ", "ha"], 26: ["ヒ", "hi"], 27: ["フ", "fu"], 28: ["ヘ", "he"], 29: ["ホ", "ho"],
                                30: ["マ", "ma"], 31: ["ミ", "mi"], 32: ["ム", "mu"], 33: ["メ", "me"], 34: ["モ", "mo"],
                                35: ["ヤ", "ya"], 36: ["ユ", "yu"], 37: ["ヨ", "yo"],
                                38: ["ラ", "ra"], 39: ["リ", "ri"], 40: ["ル", "ru"], 41: ["レ", "re"], 42: ["ロ", "ro"],
                                43: ["ワ", "wa"], 44: ["ヲ", "wo"],
                                45: ["ン", "n"],
                                46: ["ガ", "ga"], 47: ["ギ", "gi"], 48: ["グ", "gu"], 49: ["ゲ", "ge"], 50: ["ゴ", "go"],
                                51: ["ザ", "za"], 52: ["ジ", "ji"], 53: ["ズ", "zu"], 54: ["ゼ", "ze"], 55: ["ゾ", "zo"],
                                56: ["ダ", "da"], 57: ["ヂ", "di"], 58: ["ヅ", "dzu"], 59: ["デ", "de"], 60: ["ド", "do"],
                                61: ["バ", "ba"], 62: ["ビ", "bi"], 63: ["ブ", "bu"], 64: ["ベ", "be"], 65: ["ボ", "bo"],
                                66: ["パ", "pa"], 67: ["ピ", "pi"], 68: ["プ", "pu"], 69: ["ペ", "pe"], 70: ["ポ", "po"]]

            katakanaViewController.dict = katakanaDict
            
        default:
            fatalError("Uexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    

}
