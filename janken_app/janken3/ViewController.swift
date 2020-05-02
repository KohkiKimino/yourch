//
//  ViewController.swift
//  janken3
//
//  Created by MACUser on 2020/04/13.
//  Copyright © 2020 MACUser. All rights reserved.
//
import UIKit
class ViewController: UIViewController {
    // ①IBOutlet等の宣言
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var enemHandEmojiLabel: UILabel!
    // ②プロパティ等
    var timer: Timer?
    var countNum = 0
    var cp = Int.random(in:0...2)
    
    @objc enum Handtype: Int {
        case rock = 0
        case scissors = 1
        case paper = 2
        
        func toEmoji() -> String {
            switch self {
            case .rock :
                return "👊"
            case .scissors:
                return "✌️"
            case .paper:
                return "✋"
            }
        }
    }
    // ④IBAction
    @IBAction func rock(_ sender: UIButton) {
        reset()
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timerRock), userInfo: nil, repeats: true)
    }
    @IBAction func scissors(_ sender: UIButton) {
        reset()
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timerScissors), userInfo: nil, repeats: true)
    }
    @IBAction func paper(_ sender: UIButton) {
        reset()
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timerPaper), userInfo: nil, repeats: true)
    }
    // ⑤その他の処理
    //animation
    func anime(){
        let animateHandType = Handtype(rawValue: countNum%3) ?? Handtype.rock
        enemHandEmojiLabel.text = animateHandType.toEmoji()
        countNum = countNum + 1
    }
    //result
    func janken(you:Handtype) -> String?{
        if (you.rawValue == cp){
            return "draw"
        }
        else if ((you.rawValue + 1)%3 == cp ) {
            return "win!"
        }
        else if ((you.rawValue + 2)%3 == cp ) {
            return "lose..."
        }
        return nil
    }
    //reset
    func reset(){
        countNum = 0
        result.text = "Janken...";
        cp = Int.random(in:0...2)
    }
    //janken
    @objc func startJankenWithAnimation(myHand: Handtype) {
        if ( countNum < 10) {
            anime()
        }
        else{
            self.timer?.invalidate()
            result.text = "\(janken(you: myHand)!)"
            //cpHand
            if (Handtype.rock.rawValue == cp) {
                enemHandEmojiLabel.text = Handtype.rock.toEmoji() // 👊
            } else if (Handtype.scissors.rawValue == cp) {
                enemHandEmojiLabel.text = Handtype.scissors.toEmoji() // ✌️
            } else {
                enemHandEmojiLabel.text = Handtype.paper.toEmoji() // ✋
            }
        }
    }
    //myHandRock
    @objc func timerRock(){
        startJankenWithAnimation(myHand:.rock)
    }
    //myHandScissors
    @objc func timerScissors(){
        startJankenWithAnimation(myHand:.scissors)
    }
    //myHandPaper
    @objc func timerPaper(){
        startJankenWithAnimation(myHand:.paper)
    }
}

