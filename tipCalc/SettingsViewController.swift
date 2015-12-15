//
//  SettingsViewController.swift
//  tipCalc
//
//  Created by Eric Suarez on 12/6/15.
//  Copyright © 2015 Eric Suarez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipSegControl: UISegmentedControl!
    @IBOutlet weak var defaultTipValue: UILabel!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var defaultTipPercentage = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaultTipPercentage = Int(defaults.doubleForKey("defaultTipPercentage") * 100)
        
        defaultTipValue.text = "\(defaultTipPercentage)%"
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDefaultTip(sender: AnyObject) {
        
        var defaultTipPercentages = [0.18, 0.2, 0.22]
        
        defaultTipPercentage = defaultTipPercentages[defaultTipSegControl.selectedSegmentIndex]
        
        defaultTipValue.text = "\(defaultTipPercentage * 100)%"
        
        defaults.setDouble(defaultTipPercentage, forKey: "defaultTipPercentage")
        defaults.synchronize()
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
