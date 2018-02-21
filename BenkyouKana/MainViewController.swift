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
    
    //MARK: Properties
    @IBOutlet weak var reviewBtn: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        reviewBtn.layer.cornerRadius = 8
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
        case "review":
            os_log("Going to review options.", log: OSLog.default, type: .debug)
            
        default:
            fatalError("Uexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    

}
