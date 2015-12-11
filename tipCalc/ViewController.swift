//
//  ViewController.swift
//  tipCalc
//
//  Created by Eric Suarez on 12/4/15.
//  Copyright © 2015 Eric Suarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegControl: UISegmentedControl!
    
    var tipPercentage = Double()
    var billAmount = Double()
    var tipAmount = Double()
    var total = Double()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipPercentage = defaults.doubleForKey("defaultTipPercentage")
        
        if tipPercentage == 0.18 {
            tipSegControl.selectedSegmentIndex = 0
        } else if tipPercentage == 0.2 {
            tipSegControl.selectedSegmentIndex = 1
        } else if tipPercentage == 0.22 {
            tipSegControl.selectedSegmentIndex = 2
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
        billField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChange(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        
        tipPercentage = tipPercentages[tipSegControl.selectedSegmentIndex]
        
        billAmount = Double(billField.text!)!
        tipAmount = billAmount * tipPercentage
        total = billAmount + tipAmount
        
        tipLabel.text = "$\(tipAmount)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
}

