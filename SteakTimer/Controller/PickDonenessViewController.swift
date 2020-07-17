//
//  ViewController.swift
//  SteakTimer
//
//  Created by wade chen on 1/7/20.
//  Copyright © 2020 Chris. All rights reserved.
//

import UIKit

class PickDonenessViewController: UIViewController {
    
    var meatBrain = MeatBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func meatDonePressed(_ sender: UIButton) {
        
        meatBrain.pickMeatDoneness(choice: sender.currentTitle ?? "")
        
        self.performSegue(withIdentifier: "donenessIdentifier", sender: self)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "donenessIdentifier" {
            let destinationVC = segue.destination as! TimerViewController
            destinationVC.temperature = meatBrain.getTemperature()
            destinationVC.timeMin = meatBrain.getCookingTimeMin()
            destinationVC.timeSec = meatBrain.getCookingTimeSec()
        }

    }
    
}

