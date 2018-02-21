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
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    
    var pickerData: [String] = [String]()
    var pickerSelection = 0
    var hiraganaDictArray = [[Int: [String]]]()
    var katakanaDictArray = [[Int: [String]]]()
    var kana = Kana(name: "Hiragana", numberOfExercises: 25, dict: [0: ["あ", "a"]])
    
    
    // Hiragana Sets
    // A-N Set
    let hiraganaANDict = [0: ["あ", "a"], 1: ["い", "i"], 2: ["う", "u"], 3: ["え", "e"], 4: ["お", "o"],
                        5: ["か", "ka"], 6: ["き", "ki"], 7: ["く", "ku"], 8: ["け", "ke"], 9: ["こ", "ko"],
                        10: ["さ", "sa"], 11: ["し", "shi"], 12: ["す", "su"], 13: ["せ", "se"], 14: ["そ", "so"],
                        15: ["た", "ta"], 16: ["ち", "chi"], 17: ["つ", "tsu"], 18: ["て", "te"], 19: ["と", "to"],
                        20: ["な", "na"], 21: ["に", "ni"], 22: ["ぬ", "nu"], 23: ["ね", "ne"], 24: ["の", "no"],
                        25: ["は", "ha"], 26: ["ひ", "hi"], 27: ["ふ", "fu"], 28: ["へ", "he"], 29: ["ほ", "ho"],
                        30: ["ま", "ma"], 31: ["み", "mi"], 32: ["む", "mu"], 33: ["め", "me"], 34: ["も", "mo"],
                        35: ["や", "ya"], 36: ["ゆ", "yu"], 37: ["よ", "yo"],
                        38: ["ら", "ra"], 39: ["り", "ri"], 40: ["る", "ru"], 41: ["れ", "re"], 42: ["ろ", "ro"],
                        43: ["わ", "wa"], 44: ["を", "wo"],
                        45: ["ん", "n"]]
    
    let hiraganaGaPoDict = [0: ["が", "ga"], 1: ["ぎ", "gi"], 2: ["ぐ", "gu"], 3: ["げ", "ge"], 4: ["ご", "go"],
                            5: ["ざ", "za"], 6: ["じ", "ji"], 7: ["ず", "zu"], 8: ["ぜ", "ze"], 9: ["ぞ", "zo"],
                            10: ["だ", "da"], 11: ["ぢ", "di"], 12: ["づ", "dzu"], 13: ["で", "de"], 14: ["ど", "do"],
                            15: ["ば", "ba"], 16: ["び", "bi"], 17: ["ぶ", "bu"], 18: ["べ", "be"], 19: ["ぼ", "bo"],
                            20: ["ぱ", "pa"], 21: ["ぴ", "pi"], 22: ["ぷ", "pu"], 23: ["ぺ", "pe"], 24: ["ぽ", "po"]]
    
    let hiraganaKyaPyoDict = [0: ["きゃ", "kya"], 1: ["きゅ", "kyu"], 2: ["きょ", "kyo"],
                          3: ["しゃ", "sha"], 4: ["しゅ", "shu"], 5: ["しょ", "sho"],
                          6: ["ちゃ", "cha"], 7: ["ちゅ", "chu"], 8: ["ちょ", "cho"],
                          9: ["にゃ", "nya"], 10: ["にゅ", "nyu"], 11: ["にょ", "nyo"],
                          12: ["ひゃ", "hya"], 13: ["ひゅ", "hyu"], 14: ["ひょ", "hyo"],
                          15: ["みゃ", "mya"], 16: ["みゅ", "myu"], 17: ["みょ", "myo"],
                          18: ["りゃ", "rya"], 19: ["りゅ", "ryu"], 20: ["りょ", "ryo"],
                          21: ["ぎゃ", "gya"], 22: ["ぎゅ", "gyu"], 23: ["ぎょ", "gyo"],
                          24: ["じゃ", "jya"], 25: ["じゅ", "jyu"], 26: ["じょ", "jyo"],
                          27: ["びゃ", "bya"], 28: ["びゅ", "byu"], 29: ["びょ", "byo"],
                          30: ["ぴゃ", "pya"], 31: ["ぴゅ", "pyu"], 32: ["ぴょ", "pyo"]]
    
    let hiraganaAPoDict = [0: ["あ", "a"], 1: ["い", "i"], 2: ["う", "u"], 3: ["え", "e"], 4: ["お", "o"],
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
    
    let hiraganaAPyoDict = [0: ["あ", "a"], 1: ["い", "i"], 2: ["う", "u"], 3: ["え", "e"], 4: ["お", "o"],
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
                            46: ["きゃ", "kya"], 47: ["きゅ", "kyu"], 48: ["きょ", "kyo"],
                            49: ["しゃ", "sha"], 50: ["しゅ", "shu"], 51: ["しょ", "sho"],
                            52: ["ちゃ", "cha"], 53: ["ちゅ", "chu"], 54: ["ちょ", "cho"],
                            55: ["にゃ", "nya"], 56: ["にゅ", "nyu"], 57: ["にょ", "nyo"],
                            58: ["ひゃ", "hya"], 59: ["ひゅ", "hyu"], 60: ["ひょ", "hyo"],
                            61: ["みゃ", "mya"], 62: ["みゅ", "myu"], 63: ["みょ", "myo"],
                            64: ["りゃ", "rya"], 65: ["りゅ", "ryu"], 66: ["りょ", "ryo"],
                            67: ["ぎゃ", "gya"], 68: ["ぎゅ", "gyu"], 69: ["ぎょ", "gyo"],
                            70: ["じゃ", "jya"], 71: ["じゅ", "jyu"], 72: ["じょ", "jyo"],
                            73: ["びゃ", "bya"], 74: ["びゅ", "byu"], 75: ["びょ", "byo"],
                            76: ["ぴゃ", "pya"], 77: ["ぴゅ", "pyu"], 78: ["ぴょ", "pyo"]]
    
    let hiraganaGaPyoDict = [0: ["が", "ga"], 1: ["ぎ", "gi"], 2: ["ぐ", "gu"], 3: ["げ", "ge"], 4: ["ご", "go"],
                             5: ["ざ", "za"], 6: ["じ", "ji"], 7: ["ず", "zu"], 8: ["ぜ", "ze"], 9: ["ぞ", "zo"],
                             10: ["だ", "da"], 11: ["ぢ", "di"], 12: ["づ", "dzu"], 13: ["で", "de"], 14: ["ど", "do"],
                             15: ["ば", "ba"], 16: ["び", "bi"], 17: ["ぶ", "bu"], 18: ["べ", "be"], 19: ["ぼ", "bo"],
                             20: ["ぱ", "pa"], 21: ["ぴ", "pi"], 22: ["ぷ", "pu"], 23: ["ぺ", "pe"], 24: ["ぽ", "po"],
                             25: ["きゃ", "kya"], 26: ["きゅ", "kyu"], 27: ["きょ", "kyo"],
                             28: ["しゃ", "sha"], 29: ["しゅ", "shu"], 30: ["しょ", "sho"],
                             31: ["ちゃ", "cha"], 32: ["ちゅ", "chu"], 33: ["ちょ", "cho"],
                             34: ["にゃ", "nya"], 35: ["にゅ", "nyu"], 36: ["にょ", "nyo"],
                             37: ["ひゃ", "hya"], 38: ["ひゅ", "hyu"], 39: ["ひょ", "hyo"],
                             40: ["みゃ", "mya"], 41: ["みゅ", "myu"], 42: ["みょ", "myo"],
                             43: ["りゃ", "rya"], 44: ["りゅ", "ryu"], 45: ["りょ", "ryo"],
                             46: ["ぎゃ", "gya"], 47: ["ぎゅ", "gyu"], 48: ["ぎょ", "gyo"],
                             49: ["じゃ", "jya"], 50: ["じゅ", "jyu"], 51: ["じょ", "jyo"],
                             52: ["びゃ", "bya"], 53: ["びゅ", "byu"], 54: ["びょ", "byo"],
                             55: ["ぴゃ", "pya"], 56: ["ぴゅ", "pyu"], 57: ["ぴょ", "pyo"]]
    
    let hiraganaFullSet = [0: ["あ", "a"], 1: ["い", "i"], 2: ["う", "u"], 3: ["え", "e"], 4: ["お", "o"],
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
                           66: ["ぱ", "pa"], 67: ["ぴ", "pi"], 68: ["ぷ", "pu"], 69: ["ぺ", "pe"], 70: ["ぽ", "po"],
                           71: ["きゃ", "kya"], 72: ["きゅ", "kyu"], 73: ["きょ", "kyo"],
                           74: ["しゃ", "sha"], 75: ["しゅ", "shu"], 76: ["しょ", "sho"],
                           77: ["ちゃ", "cha"], 78: ["ちゅ", "chu"], 79: ["ちょ", "cho"],
                           80: ["にゃ", "nya"], 81: ["にゅ", "nyu"], 82: ["にょ", "nyo"],
                           83: ["ひゃ", "hya"], 84: ["ひゅ", "hyu"], 85: ["ひょ", "hyo"],
                           86: ["みゃ", "mya"], 87: ["みゅ", "myu"], 88: ["みょ", "myo"],
                           89: ["りゃ", "rya"], 90: ["りゅ", "ryu"], 91: ["りょ", "ryo"],
                           92: ["ぎゃ", "gya"], 93: ["ぎゅ", "gyu"], 94: ["ぎょ", "gyo"],
                           95: ["じゃ", "jya"], 96: ["じゅ", "jyu"], 97: ["じょ", "jyo"],
                           98: ["びゃ", "bya"], 99: ["びゅ", "byu"], 100: ["びょ", "byo"],
                           101: ["ぴゃ", "pya"], 102: ["ぴゅ", "pyu"], 103: ["ぴょ", "pyo"]]
    
    
    // Katakana Set
    // A-N Set
    let katakanaANDict = [0: ["ア", "a"], 1: ["イ", "i"], 2: ["ウ", "u"], 3: ["エ", "e"], 4: ["オ", "o"],
                        5: ["カ", "ka"], 6: ["キ", "ki"], 7: ["ク", "ku"], 8: ["ケ", "ke"], 9: ["コ", "ko"],
                        10: ["サ", "sa"], 11: ["シ", "shi"], 12: ["ス", "su"], 13: ["セ", "se"], 14: ["ソ", "so"],
                        15: ["タ", "ta"], 16: ["チ", "chi"], 17: ["ツ", "tsu"], 18: ["テ", "te"], 19: ["ト", "to"],
                        20: ["ナ", "na"], 21: ["ニ", "ni"], 22: ["ヌ", "nu"], 23: ["ネ", "ne"], 24: ["ノ", "no"],
                        25: ["ハ", "ha"], 26: ["ヒ", "hi"], 27: ["フ", "fu"], 28: ["ヘ", "he"], 29: ["ホ", "ho"],
                        30: ["マ", "ma"], 31: ["ミ", "mi"], 32: ["ム", "mu"], 33: ["メ", "me"], 34: ["モ", "mo"],
                        35: ["ヤ", "ya"], 36: ["ユ", "yu"], 37: ["ヨ", "yo"],
                        38: ["ラ", "ra"], 39: ["リ", "ri"], 40: ["ル", "ru"], 41: ["レ", "re"], 42: ["ロ", "ro"],
                        43: ["ワ", "wa"], 44: ["ヲ", "wo"],
                        45: ["ン", "n"]]
    
    let katakanaGaPoDict = [0: ["ガ", "ga"], 1: ["ギ", "gi"], 2: ["グ", "gu"], 3: ["ゲ", "ge"], 4: ["ゴ", "go"],
                            5: ["ザ", "za"], 6: ["ジ", "ji"], 7: ["ズ", "zu"], 8: ["ゼ", "ze"], 9: ["ゾ", "zo"],
                            10: ["ダ", "da"], 11: ["ヂ", "di"], 12: ["ヅ", "dzu"], 13: ["デ", "de"], 14: ["ド", "do"],
                            15: ["バ", "ba"], 16: ["ビ", "bi"], 17: ["ブ", "bu"], 18: ["ベ", "be"], 19: ["ボ", "bo"],
                            20: ["パ", "pa"], 21: ["ピ", "pi"], 22: ["プ", "pu"], 23: ["ペ", "pe"], 24: ["ポ", "po"]]
    
    let katakanaKyaPyoDict = [0: ["キャ", "kya"], 1: ["キュ", "kyu"], 2: ["キョ", "kyo"],
                          3: ["シャ", "sha"], 4: ["シュ", "shu"], 5: ["ショ", "sho"],
                          6: ["チャ", "cha"], 7: ["チュ", "chu"], 8: ["チョ", "cho"],
                          9: ["ニャ", "nya"], 10: ["ニュ", "nyu"], 11: ["ニョ", "nyo"],
                          12: ["ヒャ", "hya"], 13: ["ヒュ", "hyu"], 14: ["ヒョ", "hyo"],
                          15: ["ミャ", "mya"], 16: ["ミュ", "myu"], 17: ["ミョ", "myo"],
                          18: ["リャ", "rya"], 19: ["リュ", "ryu"], 20: ["リョ", "ryo"],
                          21: ["ギャ", "gya"], 22: ["ギュ", "gyu"], 23: ["ギョ", "gyo"],
                          24: ["ジャ", "jya"], 25: ["ジュ", "jyu"], 26: ["ジョ", "jyo"],
                          27: ["ビャ", "bya"], 28: ["ビュ", "byu"], 29: ["ビョ", "byo"],
                          30: ["ピャ", "pya"], 31: ["ピュ", "pyu"], 32: ["ピョ", "pyo"]]
    
    let katakanaAPoDict = [0: ["ア", "a"], 1: ["イ", "i"], 2: ["ウ", "u"], 3: ["エ", "e"], 4: ["オ", "o"],
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
    
    let katakanaAPyoDict = [0: ["ア", "a"], 1: ["イ", "i"], 2: ["ウ", "u"], 3: ["エ", "e"], 4: ["オ", "o"],
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
                            46: ["キャ", "kya"], 47: ["キュ", "kyu"], 48: ["キョ", "kyo"],
                            49: ["シャ", "sha"], 50: ["シュ", "shu"], 51: ["ショ", "sho"],
                            52: ["チャ", "cha"], 53: ["チュ", "chu"], 54: ["チョ", "cho"],
                            55: ["ニャ", "nya"], 56: ["ニュ", "nyu"], 57: ["ニョ", "nyo"],
                            58: ["ヒャ", "hya"], 59: ["ヒュ", "hyu"], 60: ["ヒョ", "hyo"],
                            61: ["ミャ", "mya"], 62: ["ミュ", "myu"], 63: ["ミョ", "myo"],
                            64: ["リャ", "rya"], 65: ["リュ", "ryu"], 66: ["リョ", "ryo"],
                            67: ["ギャ", "gya"], 68: ["ギュ", "gyu"], 69: ["ギョ", "gyo"],
                            70: ["ジャ", "jya"], 71: ["ジュ", "jyu"], 72: ["ジョ", "jyo"],
                            73: ["ビャ", "bya"], 74: ["ビュ", "byu"], 75: ["ビョ", "byo"],
                            76: ["ピャ", "pya"], 77: ["ピュ", "pyu"], 78: ["ピョ", "pyo"]]
    
    let katakanaGaPyoDict = [0: ["ガ", "ga"], 1: ["ギ", "gi"], 2: ["グ", "gu"], 3: ["ゲ", "ge"], 4: ["ゴ", "go"],
                             5: ["ザ", "za"], 6: ["ジ", "ji"], 7: ["ズ", "zu"], 8: ["ゼ", "ze"], 9: ["ゾ", "zo"],
                             10: ["ダ", "da"], 11: ["ヂ", "di"], 12: ["ヅ", "dzu"], 13: ["デ", "de"], 14: ["ド", "do"],
                             15: ["バ", "ba"], 16: ["ビ", "bi"], 17: ["ブ", "bu"], 18: ["ベ", "be"], 19: ["ボ", "bo"],
                             20: ["パ", "pa"], 21: ["ピ", "pi"], 22: ["プ", "pu"], 23: ["ペ", "pe"], 24: ["ポ", "po"],
                             25: ["キャ", "kya"], 26: ["キュ", "kyu"], 27: ["キョ", "kyo"],
                             28: ["シャ", "sha"], 29: ["シュ", "shu"], 30: ["ショ", "sho"],
                             31: ["チャ", "cha"], 32: ["チュ", "chu"], 33: ["チョ", "cho"],
                             34: ["ニャ", "nya"], 35: ["ニュ", "nyu"], 36: ["ニョ", "nyo"],
                             37: ["ヒャ", "hya"], 38: ["ヒュ", "hyu"], 39: ["ヒョ", "hyo"],
                             40: ["ミャ", "mya"], 41: ["ミュ", "myu"], 42: ["ミョ", "myo"],
                             43: ["リャ", "rya"], 44: ["リュ", "ryu"], 45: ["リョ", "ryo"],
                             46: ["ギャ", "gya"], 47: ["ギュ", "gyu"], 48: ["ギョ", "gyo"],
                             49: ["ジャ", "jya"], 50: ["ジュ", "jyu"], 51: ["ジョ", "jyo"],
                             52: ["ビャ", "bya"], 53: ["ビュ", "byu"], 54: ["ビョ", "byo"],
                             55: ["ピャ", "pya"], 56: ["ピュ", "pyu"], 57: ["ピョ", "pyo"]]
    
    let katakanaFullSet = [0: ["ア", "a"], 1: ["イ", "i"], 2: ["ウ", "u"], 3: ["エ", "e"], 4: ["オ", "o"],
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
                           66: ["パ", "pa"], 67: ["ピ", "pi"], 68: ["プ", "pu"], 69: ["ペ", "pe"], 70: ["ポ", "po"],
                           71: ["キャ", "kya"], 72: ["キュ", "kyu"], 73: ["キョ", "kyo"],
                           74: ["シャ", "sha"], 75: ["シュ", "shu"], 76: ["ショ", "sho"],
                           77: ["チャ", "cha"], 78: ["チュ", "chu"], 79: ["チョ", "cho"],
                           80: ["ニャ", "nya"], 81: ["ニュ", "nyu"], 82: ["ニョ", "nyo"],
                           83: ["ヒャ", "hya"], 84: ["ヒュ", "hyu"], 85: ["ヒョ", "hyo"],
                           86: ["ミャ", "mya"], 87: ["ミュ", "myu"], 88: ["ミョ", "myo"],
                           89: ["リャ", "rya"], 90: ["リュ", "ryu"], 91: ["リョ", "ryo"],
                           92: ["ギャ", "gya"], 93: ["ギュ", "gyu"], 94: ["ギョ", "gyo"],
                           95: ["ジャ", "jya"], 96: ["ジュ", "jyu"], 97: ["ジョ", "jyo"],
                           98: ["ビャ", "bya"], 99: ["ビュ", "byu"], 100: ["ビョ", "byo"],
                           101: ["ピャ", "pya"], 102: ["ピュ", "pyu"], 103: ["ピョ", "pyo"]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Disable done button until valid input is entered
        doneBtn.isEnabled = false
        
        // Set border around Hiragana Button by default
        hiraganaButton.layer.borderWidth = 3
        hiraganaButton.layer.borderColor = UIColor(red:0.67, green:0.04, blue:0.39, alpha:1.0).cgColor
        
        // Handle the text field's user input
        self.excercisesTextField.delegate = self
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["A-N", "Ga-Po", "Kya-Pyo", "A-N and Ga-Po", "A-N and Kya-Pyo",
                      "Ga-Po and Kya-Pyo", "Full Set"]
        hiraganaDictArray = [hiraganaANDict, hiraganaGaPoDict, hiraganaKyaPyoDict, hiraganaAPoDict, hiraganaAPyoDict,
                             hiraganaGaPyoDict, hiraganaFullSet]
        katakanaDictArray = [katakanaANDict, katakanaGaPoDict, katakanaKyaPyoDict, katakanaAPoDict, katakanaAPyoDict,
                             hiraganaGaPyoDict, katakanaFullSet]
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
        if Int(excercisesTextField.text!) != nil {
            kana.numberOfExercises = Int(excercisesTextField.text!)!
            doneBtn.isEnabled = true
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
        
        pickerSelection = row
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
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "StartReview":
            guard let kanaViewController = segue.destination as? KanaViewController
                else {
                    fatalError("Uexpected destination \(segue.destination)")
            }
            
            kanaViewController.kana.name = kana.name
            kanaViewController.kana.numberOfExercises = kana.numberOfExercises
            
            if kana.name == "Hiragana" {
                kanaViewController.kana.dict = hiraganaDictArray[pickerSelection]
            } else if kana.name == "Katakana" {
                kanaViewController.kana.dict = katakanaDictArray[pickerSelection]
            }
            
            
            
        default:
            fatalError("Uexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    

}
