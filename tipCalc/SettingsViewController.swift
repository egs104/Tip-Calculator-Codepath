//
//  SettingsViewController.swift
//  tipCalc
//
//  Created by Eric Suarez on 12/6/15.
//  Copyright © 2015 Eric Suarez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var defaultTipValue: UILabel!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultTip = Int(defaults.doubleForKey("defaultTipPercentage") * 100)
        
        defaultTipValue.text = "\(defaultTip)%"
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setTo18(sender: AnyObject) {
        
        defaults.setDouble(0.18, forKey: "defaultTipPercentage")
        defaultTipValue.text = "18%"
        defaults.synchronize()
        
    }

    @IBAction func setTo20(sender: AnyObject) {
        
        defaults.setDouble(0.20, forKey: "defaultTipPercentage")
        defaultTipValue.text = "20%"
        defaults.synchronize()
        
    }
    
    @IBAction func setTo22(sender: AnyObject) {
        
        defaults.setDouble(0.22, forKey: "defaultTipPercentage")
        defaultTipValue.text = "22%"
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
