//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipNumber: Float = 0.1
    var splitResult: Float = 0.0
    @IBAction func tipChanged(_ sender: UIButton) {
        
        sender.isSelected = true
        switch sender {
        case zeroPctButton:
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipNumber = 0.0
        case tenPctButton:
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipNumber = 0.1
        case twentyPctButton:
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            tipNumber = 0.2
        default:
            tipNumber = 0.1
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let splitNumber = Float(splitNumberLabel.text!) ?? 2.0
        let billTatol = Float(billTextField.text ?? "0.0") ?? 0.0
        splitResult = billTatol * (tipNumber + 1) / splitNumber
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = String(format: "%.2f", splitResult)
            destinationVC.people = splitNumberLabel.text
            destinationVC.tipValue = String(format: "%.0f%%", tipNumber * 100)
        }
        
        
    }
}

