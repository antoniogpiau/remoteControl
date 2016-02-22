//
//  DVRViewController.swift
//  remoteControl
//
//  Created by Antonio Piau on 2/9/16.
//  Copyright © 2016 Antonio Piau. All rights reserved.
//

import UIKit

class DVRViewController: UIViewController {

    @IBOutlet weak var labelPower: UILabel!
    @IBOutlet weak var labelState: UILabel!
    @IBOutlet weak var switcherPower: UISwitch!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var buttonStop: UIButton!
    @IBOutlet weak var buttonPause: UIButton!
    @IBOutlet weak var buttonFoward: UIButton!
    @IBOutlet weak var buttonRewind: UIButton!
    @IBOutlet weak var buttonRecord: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func switcherPowerPressed(sender: UISwitch) {
        if (switcherPower.on){
            labelPower.text = "On";
            labelState.text = "Stopped";
        }else
        {
            labelPower.text = "Off";
        }
        buttonPlay.enabled = switcherPower.on;
        buttonStop.enabled = switcherPower.on;
        buttonPause.enabled = switcherPower.on;
        buttonFoward.enabled = switcherPower.on;
        buttonRewind.enabled = switcherPower.on;
        buttonRecord.enabled = switcherPower.on;
    }
    
    
    @IBAction func buttonPlayPressed(sender: UIButton) {
        if (labelState.text != "Recording"){
            labelState.text = "Playing";
        }else{
            showErrorPopUp("Playing")
        }
    }
    
    @IBAction func buttonStopPressed(sender: UIButton) {
            labelState.text = "Stopped";
    }
    
    @IBAction func buttonPausePressed(sender: UIButton) {
        if (labelState.text == "Playing"){
            labelState.text = "Paused";
        }else{
            showErrorPopUp("Paused")
        }
    }
    
    @IBAction func buttonFowardPressed(sender: UIButton) {
        if (labelState.text == "Playing"){
            labelState.text = "FF";
        }else{
            showErrorPopUp("FF")
        }
    }
    
    @IBAction func buttonRewindPressed(sender: AnyObject) {
        if (labelState.text == "Playing"){
            labelState.text = "FR";
        }else{
            showErrorPopUp("FR")
        }
    }
    
    @IBAction func buttonRecordPressed(sender: UIButton) {
        if (labelState.text == "Stopped"){
            labelState.text = "Recording";
        }else{
            showErrorPopUp("Recording")
        }
    }
    
    func showErrorPopUp(s : String){
        let alert = UIAlertController(title: "Error", message: "You can't perform this operation in this current state, do you want to stop the current operation and force your command?", preferredStyle: UIAlertControllerStyle.Alert)
        let confirmationAlert = UIAlertController(title: "Done", message: "The current operation has stopped and the requested operation will now proceed.", preferredStyle: UIAlertControllerStyle.Alert)
        confirmationAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil))

        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: { action in
            self.labelState.text = "Stopped";
            self.presentViewController(confirmationAlert, animated: true, completion: nil)
            self.labelState.text = s;
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
