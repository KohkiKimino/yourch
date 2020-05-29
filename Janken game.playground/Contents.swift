import Cocoa
enum Handtype: Int {
    case rock = 0
    case scissors = 1
    case paper = 2
}
enum Result: String {
case win
case lose
case draw
}
func janken(you:Handtype) -> Result?{
    let cp = Int.random(in:0...2)
    
    if (you.rawValue == cp){
        return .draw
    }
    if ((you.rawValue + 1)%3 == cp ) {
        return .win
    }
    else if ((you.rawValue + 2)%3 == cp ) {
        return .lose
    }
    return nil
}
print(janken(you: .rock)!)
