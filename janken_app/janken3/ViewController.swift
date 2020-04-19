//
//  ViewController.swift
//  janken3
//
//  Created by MACUser on 2020/04/13.
//  Copyright © 2020 MACUser. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    var timer: Timer?
    var countNum = 0
    let n = Int.random(in:0...2)
    override func viewDidLoad(){
        super.viewDidLoad()
        }
    @objc func timer_rock(){
            if countNum < 10 {
                if( countNum%3 == 0) { //グー
                //result.text = "\(countNum)";
                    image.text = "👊";
                } else if( countNum%3 == 1) { //チョキ
                    image.text = "✌️";
                } else { //パー
                    image.text = "✋";
                }
                countNum = countNum + 1;
            }
            else{
                self.timer?.invalidate()
                if( n == 0) { //グー
                    result.text = "draw";
                    image.text = "👊";
                } else if( n == 1) { //チョキ
                    result.text = "you win!";
                    image.text = "✌️";
                } else { //パー
                    result.text = "you lose...";
                    image.text = "✋";
                }
            }
    }
    @objc func timer_scissors(){
            if countNum < 10 {
                if( countNum%3 == 0) { //グー
                //result.text = "\(countNum)";
                    image.text = "👊";
                } else if( countNum%3 == 1) { //チョキ
                    image.text = "✌️";
                } else { //パー
                    image.text = "✋";
                }
                countNum = countNum + 1;
            }
            else{
                self.timer?.invalidate()
                if( n == 0) { //グー
                    result.text = "you lose...";
                    image.text = "👊";
                } else if( n == 1) { //チョキ
                    result.text = "draw";
                    image.text = "✌️";
                } else { //パー
                    result.text = "you win!";
                    image.text = "✋";
                }
            }
    }
    @objc func timer_paper(){
            if countNum < 10 {
                if( countNum%3 == 0) { //グー
                //result.text = "\(countNum)";
                    image.text = "👊";
                } else if( countNum%3 == 1) { //チョキ
                    image.text = "✌️";
                } else { //パー
                    image.text = "✋";
                }
                countNum = countNum + 1;
            }
            else{
                self.timer?.invalidate()
                if( n == 0) { //グー
                    result.text = "you win!";
                    image.text = "👊";
                } else if( n == 1) { //チョキ
                    result.text = "you lose...";
                    image.text = "✌️";
                } else { //パー
                    result.text = "draw";
                    image.text = "✋";
                }
            }
    }
    @IBAction func rock(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timer_rock), userInfo: nil, repeats: true)
    }
    @IBAction func scissors(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timer_scissors), userInfo: nil, repeats: true)
    }
    @IBAction func paper(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timer_paper), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var image: UILabel!
}

