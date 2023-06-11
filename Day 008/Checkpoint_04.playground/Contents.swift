import Cocoa

enum mathsError: Error {
    case outOfBounds
    case noRoot
}

func findSquareRoot(_ number: Int) throws -> Int {
    if number <= 0 || number > 10_000 {
        throw mathsError.outOfBounds
    }
    
    for i in 1...number {
        if i * i == number {
            return i
        }
    }
    
    throw mathsError.noRoot
}

do {
    var root = try findSquareRoot(10_001)
    print("the square root is \(root)")
} catch mathsError.noRoot {
    print("no root was found")
} catch mathsError.outOfBounds {
    print("number needs to be 1 and 10,000")
} catch {
    print(error.localizedDescription)
}
