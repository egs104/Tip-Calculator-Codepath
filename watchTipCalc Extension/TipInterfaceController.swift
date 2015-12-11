//
//  TipInterfaceController.swift
//  tipCalc
//
//  Created by Eric Suarez on 12/8/15.
//  Copyright © 2015 Eric Suarez. All rights reserved.
//

import WatchKit
import Foundation


class TipInterfaceController: WKInterfaceController {
    
    var tipDouble = Double()
    var totalDouble = Double()
    var perPersonDouble = Double()
    
    @IBOutlet var tipLabel: WKInterfaceLabel!
    @IBOutlet var percentLabel: WKInterfaceLabel!
    @IBOutlet var totalLabel: WKInterfaceLabel!
    @IBOutlet var perPersonLabel: WKInterfaceLabel!
    @IBOutlet var peopleLabel: WKInterfaceLabel!
    
    @IBOutlet var tipPercentSegControl: WKInterfaceSlider!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        tipDouble = Double(currentValue)! * 0.15
        totalDouble = Double(currentValue)! + tipDouble
        
        percentLabel.setText("15%")
        
        tipPercentSegControl.setValue(15)
        
        tipLabel.setText(String(format: "$%.2f", tipDouble))
        
        totalLabel.setText(String(format: "$%.2f", totalDouble))
                
    }
    
    @IBAction func sliderDidChange(value: Double) {
        
        percentLabel.setText("\(Int(value))%")
        
        tipDouble = Double(currentValue)! * (value/100)
        totalDouble = Double(currentValue)! + tipDouble
        
        tipLabel.setText(String(format: "$%.2f", tipDouble))
        
        totalLabel.setText(String(format: "$%.2f", totalDouble))
        
        
    }
    
    @IBAction func peopleDidChange(value: Double) {
        
        peopleLabel.setText("\(Int(value)) People")
        
        perPersonDouble = totalDouble / value
        
        perPersonLabel.setText(String(format: "$%.2f", perPersonDouble))
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    

}
