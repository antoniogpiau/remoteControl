//
//  ViewController.swift
//  remoteControl
//
//  Created by Antonio Piau on 1/26/16.
//  Copyright © 2016 Antonio Piau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelPower: UILabel!
    @IBOutlet weak var switchPower: UISwitch!
    @IBOutlet weak var sliderVolume: UISlider!
    @IBOutlet weak var labelVolume: UILabel!
    @IBOutlet weak var labelChanel: UILabel!
    var channel : Int = 1;
    var channelNumberPressed : Int = 0;
    var isFirstNumberChannel = true;
    @IBOutlet weak var segmentControlFavorite: UISegmentedControl!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControlFavorite.setTitle(globalVar.buttonLabel[0], forSegmentAtIndex: 0)
        segmentControlFavorite.setTitle(globalVar.buttonLabel[1], forSegmentAtIndex: 1)
        segmentControlFavorite.setTitle(globalVar.buttonLabel[2], forSegmentAtIndex: 2)
        segmentControlFavorite.setTitle(globalVar.buttonLabel[3], forSegmentAtIndex: 3)
    }
    
    override func viewWillAppear(animated:Bool){
        segmentControlFavorite.setTitle(globalVar.buttonLabel[0], forSegmentAtIndex: 0)
        segmentControlFavorite.setTitle(globalVar.buttonLabel[1], forSegmentAtIndex: 1)
        segmentControlFavorite.setTitle(globalVar.buttonLabel[2], forSegmentAtIndex: 2)
        segmentControlFavorite.setTitle(globalVar.buttonLabel[3], forSegmentAtIndex: 3)
    }
    
    
    @IBAction func switchPowerChanged(sender: UISwitch){
        if (switchPower.on){
            labelPower.text = "On";
        }else
        {
            labelPower.text = "Off";
        }
        
        sliderVolume.enabled = switchPower.on;
        buttonZero.enabled = switchPower.on;
        buttonOne.enabled = switchPower.on;
        buttonTwo.enabled = switchPower.on;
        buttonThree.enabled = switchPower.on;
        buttonFour.enabled = switchPower.on;
        buttonFive.enabled = switchPower.on;
        buttonSix.enabled = switchPower.on;
        buttonSeven.enabled = switchPower.on;
        buttonEight.enabled = switchPower.on;
        buttonNine.enabled = switchPower.on;
        buttonPlus.enabled = switchPower.on;
        buttonMinus.enabled = switchPower.on;
        segmentControlFavorite.enabled = switchPower.on;
    }
    
    @IBAction func sliderVolumeChanged(sender: AnyObject) {
        let currentValue = Int(sliderVolume.value);
        
        labelVolume.text = "\(currentValue)";
    }
    
    @IBAction func buttonNumberPressed(sender: UIButton) {
        channel = Int(sender.currentTitle!)!;
        if (isFirstNumberChannel){
            channelNumberPressed = channel;
            isFirstNumberChannel = false;
        }else{
            channel = (channelNumberPressed*10) + channel;
            labelChanel.text = String(channel);
            isFirstNumberChannel = true;
        }
    
    }
    
    @IBAction func segmentControlSelected(sender: UISegmentedControl) {
        switch segmentControlFavorite.selectedSegmentIndex
        {
        case 0:
            channel = 15;
            labelChanel.text = String(globalVar.channelNumber[0]);
        case 1:
            channel = 30;
            labelChanel.text = String(globalVar.channelNumber[1]);
        case 2:
            channel = 55;
            labelChanel.text = String(globalVar.channelNumber[2]);
        case 3:
            channel = 87;
            labelChanel.text = String(globalVar.channelNumber[3]);
        default:
            break;
        }
    }
    @IBAction func buttonChanelPressed(sender: UIButton) {
        if (sender.currentTitle == "Ch+"){
            if (channel + 1 < 100){
                channel++;
            }
        }else{
            if (channel - 1 > 0){
                channel--;
            }
        }
        labelChanel.text = String(channel);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

