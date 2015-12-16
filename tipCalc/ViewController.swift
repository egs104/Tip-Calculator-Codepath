//
//  ViewController.swift
//  tipCalc
//
//  Created by Eric Suarez on 12/4/15.
//  Copyright © 2015 Eric Suarez. All rights reserved.
//

import UIKit

extension Double {
    func asLocaleCurrency() -> String {
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(self)!
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    var tipPercentage = Double()
    var billAmount = Double()
    var tipAmount = Double()
    var total = Double()
    
    let rememberTextEntryTime = NSTimeInterval.init(600) //600 seconds = 10 min
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = UIColor.greenColor()
//        
//        self.billField.alpha = 1.0
//        self.tipLabel.alpha = 1.0
//        self.totalLabel.alpha = 1.0
//        self.tipSegControl.alpha = 1.0
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        billField.placeholder = "$0.00"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let defaultValues = ["billFieldText":"0", "lastTipTime":NSDate()]
        
        //"defaultTipPercentage":0.18
        
        defaults.registerDefaults(defaultValues)
        
        defaults.synchronize()
        
        tipSlider.value = Float(defaults.doubleForKey("defaultTipPercentage")*100)
        
        tipPercentLabel.text = "\(defaults.doubleForKey("defaultTipPercentage")*100)%"
        
        let activeTimeValue = defaults.valueForKey("lastTipTime") as! NSDate
        
        if (activeTimeValue.timeIntervalSinceNow <= rememberTextEntryTime) {
            billField.text = defaults.valueForKey("billFieldText") as! String
            onEditingChange(billField)
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipPercentage = defaults.doubleForKey("defaultTipPercentage")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
        billField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setValue(billField.text, forKey: "billFieldText")
        defaults.setValue(NSDate(), forKey: "lastTipTime")
        defaults.synchronize()
        
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
        //var tipPercentages = [0.18, 0.2, 0.22]
        
        var roundedTipValue = floor(tipSlider.value)
        
        tipPercentage = Double(roundedTipValue/100)
        
        if (billField.text != "") {
        
            billAmount = Double(billField.text!)!
            tipAmount = billAmount * tipPercentage
            total = billAmount + tipAmount
        
            tipPercentLabel.text = "\(Int(tipSlider.value))%"
            
            var formattedTipAmount = String(tipAmount.asLocaleCurrency())
            var formattedTotal = String(total.asLocaleCurrency())
            
            tipLabel.text = formattedTipAmount
            totalLabel.text = formattedTotal
        
//            tipLabel.text = String(format: "%.2f", tipAmount)
//            totalLabel.text = String(format: "%.2f", total)
            
        }
        
    }
    
    
    @IBAction func sliderDidChange(sender: AnyObject) {
        
        
        
        onEditingChange(billField)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
}

