import Cocoa

var employee = ["Taylor", "Singer", "Nashville"]

print("Name: \(employee[0])")
print("Job Title: \(employee[1])")
print("Location: \(employee[2])")

let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashwille"
]

print(employee2["name", default: "unknown"])
print(employee2["job", default: "unknown"])
print(employee2["location", default: "unknown"])

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Saquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"
