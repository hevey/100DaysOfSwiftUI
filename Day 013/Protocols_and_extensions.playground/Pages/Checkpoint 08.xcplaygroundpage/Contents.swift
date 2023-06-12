import Cocoa

protocol Building {
    var howManyRooms: Int { get set }
    var cost: Int { get set }
    var estateAgent: String { get set }
    func salesSummary()
}

extension Building {
    func salesSummary() {
        print("Sold by \(estateAgent) for \(cost) dollars")
    }
}

struct House: Building {
    var howManyRooms = 5
    var cost = 300_000
    var estateAgent = "Terry Crews"
}

struct Office: Building {
    var howManyRooms = 20
    var cost = 1_000_000
    var estateAgent = "Michael Scott"
}

let office = Office()
office.salesSummary()

let house = House()
house.salesSummary()
