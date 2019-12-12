protocol CanFly {
    func fly()

}


class Bird{

    var isFemale = true

    func canLayEggs(){
        if isFemale {
            print("This bird can lay eggs")
        }
    }
}

class Eagle: Bird, CanFly {

    func fly(){
        print("The eagle can soar")
    }

    
}

class Penguin: Bird {
    func canSwim(){
        print("This penguin can swim")
    }
}

struct flyingMuseum {
    func flyingDemo(flyingObject: CanFly){
        flyingObject.fly()
    }
}

struct Airplane: CanFly{
    func fly() {
        print("The airplane takes off from the airport")
    }
}

var myEagle = Eagle()

myEagle.isFemale = true
myEagle.canLayEggs()
var myPlane = Airplane()
let museum = flyingMuseum()
museum.flyingDemo(flyingObject: myPlane)
