import Cocoa

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()


let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello("Taylor")

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}


let data: (Int) -> String = getUserData

let user = data(1989)
print(user)


let team = ["Gloria", "Susan", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()

print(sortedTeam)


func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Susan" {
        return true
    } else if name2 == "Susan" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Susan" {
        return true
    } else if name2 == "Susan" {
        return false
    }
    
    return name1 < name2
})
print(captainFirstTeam)
