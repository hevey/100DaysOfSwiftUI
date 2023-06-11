import Cocoa

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func sameLetters(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

print(sameLetters(string1: "test", string2: "estt"))

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)
