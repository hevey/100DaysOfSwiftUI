import Cocoa

let team = ["Glorai", "Suzanne", "Piper", "Tiffany", "Tasha"]

let sorted = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzzane" {
        return false
    }
    return $0 < $1
}

print(sorted)

let reverseTeam = team.sorted { $0 > $1 }

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
