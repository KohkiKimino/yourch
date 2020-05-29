import Cocoa

func leapyear(_ n: Int) -> Bool {
    if n%4 == 0 && !(n%100 == 0 && n%400 != 0) {
    return true
    } else {
       return false
}
}
print(leapyear(1600))

