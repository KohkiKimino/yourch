<<<<<<< HEAD
=======
//
//  ViewController.swift
//  janken3
//
//  Created by MACUser on 2020/04/13.
//  Copyright © 2020 MACUser. All rights reserved.
//
>>>>>>> your-chance-patch-1
import UIKit
class ViewController: UIViewController {
    // ①IBOutlet等の宣言
    @IBOutlet weak var result: UILabel!
<<<<<<< HEAD
    @IBOutlet weak var image: UILabel!
    // ②プロパティ等
    var timer: Timer?
    var countNum = 0
    let cp = Int.random(in:0...2)
    enum Handtype: Int {
        case rock = 0
        case scissors = 1
        case paper = 2
    }
    // ④IBAction
    @IBAction func rock(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timerRock), userInfo: nil, repeats: true)
    }
    @IBAction func scissors(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timerScissors), userInfo: nil, repeats: true)
    }
    @IBAction func paper(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timerPaper), userInfo: nil, repeats: true)
    }
    // ⑤その他の処理
    //animation
    @objc func anime(){
        if( countNum%3 == 0) { //グー
            image.text = "👊"
        } else if( countNum%3 == 1) { //チョキ
            image.text = "✌️"
        } else { //パー
            image.text = "✋"
        }
        countNum = countNum + 1
    }
    //result
    func janken(you:Handtype) -> String?{
        if (you.rawValue == cp){
            return "draw"
        }
        if ((you.rawValue + 1)%3 == cp ) {
            return "win!"
        }
        else if ((you.rawValue + 2)%3 == cp ) {
            return "lose..."
        }
        return nil
    }
    //enemyHand
    func enemy(you:Handtype) -> String?{
        if (cp == 0){
            return "👊"
        }
        if (cp == 1) {
            return "✌️"
        }
        else if (cp  == 2) {
            return "✋"
        }
        return nil
    }
    //myHandRock
    @objc func timerRock(){
            if ( countNum < 10) {
                anime()
            }
            else{
                self.timer?.invalidate()
                result.text = "\(janken(you: .rock)!)"
                image.text = "\(enemy(you: .rock)!)"
            }
    }
    //myHandScissors
    @objc func timerScissors(){
            if ( countNum < 10) {
                anime()
            }
            else{
                self.timer?.invalidate()
                result.text = "\(janken(you: .scissors)!)"
                image.text = "\(enemy(you: .scissors)!)"
            }
    }
    //myHandPaper
    @objc func timerPaper(){
            if ( countNum < 10) {
                anime()
            }
            else{
                self.timer?.invalidate()
                result.text = "\(janken(you: .paper)!)"
                image.text = "\(enemy(you: .paper)!)"
=======
    @IBOutlet weak var enemHandEmojiLabel: UILabel!
    // ②プロパティ等
    var timer: Timer?
    var countNum = 0
    var cp = Int.random(in:0...2)
    enum Result: String {
        case draw = "draw"
        case win = "win!"
        case lose = "lose..."
    }
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
>>>>>>> your-chance-patch-1
            }
        }
    }
<<<<<<< HEAD
=======
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
    func anime() {
        let animateHandType = Handtype(rawValue: countNum%3) ?? Handtype.rock
        enemHandEmojiLabel.text = animateHandType.toEmoji()
        countNum = countNum + 1
    }
    //result
    func janken(you:Handtype) -> String? {
        if (you.rawValue == cp) {
            return Result.draw.rawValue
        }
        else if ((you.rawValue + 1)%3 == cp) {
            return Result.win.rawValue
        }
        else if ((you.rawValue + 2)%3 == cp) {
            return Result.lose.rawValue
        }
        return nil
    }
    //reset
    func reset() {
        countNum = 0
        result.text = "Janken...";
        cp = Int.random(in:0...2)
        self.timer?.invalidate()
    }
    //janken
    @objc func startJankenWithAnimation(myHand: Handtype) {
        if (countNum < 10) {
            anime()
        }
        else {
            self.timer?.invalidate()
            result.text = "\(janken(you: myHand) ?? Result.draw.rawValue)"
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
    @objc func timerRock() {
        startJankenWithAnimation(myHand:.rock)
    }
    //myHandScissors
    @objc func timerScissors() {
        startJankenWithAnimation(myHand:.scissors)
    }
    //myHandPaper
    @objc func timerPaper() {
        startJankenWithAnimation(myHand:.paper)
    }
>>>>>>> your-chance-patch-1
}

