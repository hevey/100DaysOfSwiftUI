import Cocoa

enum Gear {
    case up, down
}

struct Car {
    let model: String
    let noOfSeats: Int
    private(set) var currentGear: Int = 1
    
    mutating func changeGear(gear: Gear) {
        switch gear {
        case .up:
            if currentGear < 10 {
                currentGear += 1
            } else {
                print("Can't go higher")
            }
        case .down:
            if currentGear > 1 {
                currentGear -= 1
            } else {
                print("Can't go lower")
            }
        }
    }
}

var car = Car(model: "Tesla", noOfSeats: 5)

car.changeGear(gear: .up)
print(car.currentGear)
car.changeGear(gear: .down)
print(car.currentGear)
car.changeGear(gear: .down)
print(car.currentGear)
car.changeGear(gear: .up)
print(car.currentGear)
car.changeGear(gear: .up)
print(car.currentGear)
car.changeGear(gear: .up)
print(car.currentGear)
car.changeGear(gear: .up)
print(car.currentGear)
car.changeGear(gear: .up)
print(car.currentGear)
car.changeGear(gear: .up)
print(car.currentGear)
car.changeGear(gear: .up)
print(car.currentGear)
car.changeGear(gear: .up)
print(car.currentGear)
car.changeGear(gear: .up)
print(car.currentGear)
car.changeGear(gear: .up)
print(car.currentGear)
