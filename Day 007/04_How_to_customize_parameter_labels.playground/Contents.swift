import Cocoa

let lyric = "I see a red doo and I want it painted black."
print(lyric.hasPrefix("I see"))

func isUppercase(_ string:String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)


func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5)
