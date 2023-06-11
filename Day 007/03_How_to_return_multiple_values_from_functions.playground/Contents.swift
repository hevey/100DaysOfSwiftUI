import Cocoa

func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let (firstName, _) = getUser()
print("Name: \(firstName)")


