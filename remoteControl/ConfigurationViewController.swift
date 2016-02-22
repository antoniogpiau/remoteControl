//
//  ConfigurationViewController.swift
//  remoteControl
//
//  Created by Antonio Piau on 2/18/16.
//  Copyright © 2016 Antonio Piau. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {

    @IBOutlet weak var tf_Label: UITextField!
    @IBOutlet weak var sc_Button: UISegmentedControl!
    @IBOutlet weak var lb_Channel: UILabel!
    @IBOutlet weak var st_Buttons: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tf_LabelEndEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func st_Channel(sender: AnyObject) {
        lb_Channel.text = "\(Int(st_Buttons.value))"  ;
    }

    @IBAction func bt_CancelPressed(sender: UIButton) {
        tf_Label.text = ""
        st_Buttons.value = 1
        lb_Channel.text = "\(Int(st_Buttons.value))" 
        
    }

    @IBAction func bt_SavePressed(sender: UIButton) {
        if (tf_Label.text?.characters.count > 4)||(tf_Label.text?.characters.count < 1){
            let alertController = UIAlertController(title: "Error", message:
                "Label text field must be between 1-4 characters.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }

}
