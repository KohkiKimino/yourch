import UIKit
class ViewController: UIViewController {
    // ①IBOutlet等の宣言
    @IBOutlet weak var result: UILabel!
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
            }
    }
}

