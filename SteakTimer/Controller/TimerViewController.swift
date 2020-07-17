//
//  TimerViewController.swift
//  SteakTimer
//
//  Created by wade chen on 3/7/20.
//  Copyright © 2020 Chris. All rights reserved.
//
import UIKit
import AVFoundation

class TimerViewController: UIViewController {
    
    var temperature = ""
    var timeMin = 0
    var timeSec = 0
    
    var secondsReset = 0
    var minutesReset = 0
    
    var player : AVAudioPlayer?
    var timer = Timer()
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countDownTimer: UILabel!
    @IBOutlet weak var buttonState: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        secondsReset = timeSec
        minutesReset = timeMin
        
        temperatureLabel.text = temperature
        
        timeLabel.text = String(format: "%02d", timeMin) + " : " + String(format: "%02d", timeSec)
    }
    
    
    //Used to start the timer, stop the timer and restart the timer when finished
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        switch sender.currentTitle {
        case "START":
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
            buttonState.setTitle("STOP", for: .normal)
        case "STOP":
            timer.invalidate()
            buttonState.setTitle("START", for: .normal)
        case "READY":
            
            buttonState.setTitle("START", for: .normal)
        default:
            break
        }
        
    }
    
    @objc func updateTimer() {
        
        if timeSec == 0 {
            timeMin -= 1
            timeSec = 59
        } else {
            timeSec -= 1
        }
        
        countDownTimer.text = String(format: "%02d", timeMin) + " : " + String(format: "%02d", timeSec)
        
        if (timeSec == 0) && (timeMin == 0) {
            playSound()
            timer.invalidate()
            buttonState.setTitle("READY", for: .normal)
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
}
