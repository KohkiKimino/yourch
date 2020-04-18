//
//  ViewController.swift
//  janken3
//
//  Created by MACUser on 2020/04/13.
//  Copyright © 2020 MACUser. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBAction func rock(_ sender: UIButton) {
        let n = Int.random(in:0...2)
        //let n = arc4random() % 3; //乱数発生
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
    @IBAction func scissors(_ sender: UIButton) {
        let n = Int.random(in:0...2)
        //let n = arc4random() % 3; //乱数発生
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
    @IBAction func paper(_ sender: UIButton) {
        let n = Int.random(in:0...2)
        //let n = arc4random() % 3; //乱数発生
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
    @IBOutlet weak var result: UILabel!

    @IBOutlet weak var image: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

