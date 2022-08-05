//
//  ResultsViewController.swift
//  Tipsy
//  
//  Created by CoderSamz on 2022.
// 	Copyright © 2022 The App Brewery. All rights reserved.
// 
    

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String?
    var people: String?
    var tipValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result ?? "0.0"
        settingsLabel.text = "Split between \(people ?? "2") people, with \(tipValue ?? "10%") tip."
    }
   
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
