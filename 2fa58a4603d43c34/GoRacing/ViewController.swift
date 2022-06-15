//
//  ViewController.swift
//  GoRacing
//
//  Created by Гость on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pcCAR: UIImageView!
    @IBOutlet weak var userCAR: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var semaforLabel: UILabel!
    @IBOutlet weak var lineFinish: UIImageView!
    

    var stateSemafor: Int = 1
    var timerGame: Timer!
    var timerPC: Timer!
    
    @objc func pcDrive() {
        
        if stateSemafor == 2 {
            pcCAR.center.x += 10
            
        }
        
        if pcCAR.center.x > lineFinish.center.x {
            resultLabel.isHighlighted = false
            resultLabel.text = "YOU LOSE"
            resultLabel.textColor = .red
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }
    
    @objc func intervalTimer() {
        
        stateSemafor += 1
        if stateSemafor > 2 {
            stateSemafor = 1
        }
        switch stateSemafor {
        case 1:
            semaforLabel.text = "STOP"
            semaforLabel.textColor = .red
        case 2:
            semaforLabel.text = "DRIVE"
            semaforLabel.textColor = .green
        default:
            break
        }
    }
    @IBAction func startGame(_ sender: UIButton) {
        semaforLabel.isHidden = false
        timerGame = 
            Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalTimer), userInfo: nil, repeats: true)
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDrive), userInfo: nil, repeats: true)
    }
    @IBAction func driveGame(_ sender: UIButton) {
        if stateSemafor == 2 {
            userCAR.center.x += 10
        } else if stateSemafor == 1 {
            userCAR.center.x -= 10
        }
        if userCAR.center.x > lineFinish.center.x {
            resultLabel.isHidden = false
            resultLabel.text = "YOU WIN"
            resultLabel.textColor = .green
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }
    
}

