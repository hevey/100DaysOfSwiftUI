import Cocoa

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Dog barking")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Corgi barking")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poodle barking")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Cat meowing")
    }
}

class Persian: Cat {
    override func speak() {
        print("Persian Meowing")
    }
}

class Lion: Cat {
    override func speak() {
        print("Lion Rawring")
    }
}
