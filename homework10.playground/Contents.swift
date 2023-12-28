import UIKit


//задание 1

protocol CalorieCountProtocol {
    var calories: Int { get }
    func description() -> String
}


struct GetCalorie: CalorieCountProtocol {
    var calories: Int
    func description() -> String {
     return "I get \(calories) calories today"
    }
}

let getCal = GetCalorie(calories: 1800)
print(getCal.description())




class CalorieCount: CalorieCountProtocol {
    var calories: Int
    var trueCalories: Int = 2200
    
    
    init(calories: Int, weight: Int) {
       self.calories = calories
    }
    
    func description() -> String {
        return "I have to get \(trueCalories - calories) more calories today"
    }
}

let needCal = CalorieCount(calories: 1800, weight: 72)
print(needCal.description())




enum CalorieCountType: CalorieCountProtocol {

    var calories: Int {
        return 1800
    }

    case more, less, ok
    func description() -> String {
        var descr: String
        switch self {
        case.more:
        descr = "Need more food"
        case.less:
        descr = "No more food today"
        case.ok:
        descr = "It is enough"
        }
         return descr
    }

}
let result = CalorieCountType.description(.more)
print(result().description)





//задание 2


enum BalanceType {
    case positive, negative, neutral
}

struct Balance: Equatable {
    let type: BalanceType
    let amount: Int
}



class BalanceObject: Equatable {
    static func == (lhs: BalanceObject, rhs: BalanceObject) -> Bool {
        return lhs.amount == rhs.amount && lhs.type == rhs.type
    }

    var amount: Int = 0
    let type: BalanceType
  

    
    init (type: BalanceType, amount: Int)  {
        self.type = type
        self.amount = amount
    }
}

let struc1 = Balance(type: BalanceType.positive, amount: 5)
let struc2 = Balance(type: BalanceType.negative, amount: 1)
let struc3 = Balance(type: BalanceType.positive, amount: 5)
struc1 == struc2
struc1 == struc3



let class1 = BalanceObject(type: BalanceType.neutral, amount: 2)
let class2 = BalanceObject(type: BalanceType.positive, amount: 5)
let class3 = BalanceObject(type: BalanceType.neutral, amount: 2)
class1 == class2
class1 == class3


//задание 3


protocol Dog {
    var name: String { get set }
    var color: String { get set }
}

extension Dog {
    func speak() -> String {
        return "gav!"
    }
}

struct Haski: Dog {
    var name: String
    var color: String
}

class Corgi: Dog {
    var name: String
    var color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}

struct Hound: Dog {
    var name: String
    var color: String
}

let haski1 = Haski(name: "Snowball", color: "Gray")
let corgi1 = Corgi(name: "Luna", color: "Orange")
let hound1 = Hound(name: "Druzhok", color: "White")


let dogs: [Dog] = [haski1, corgi1, hound1]
for dog in dogs {
    print ("\(dog.color) \(dog.name) say \(dog.speak())")
}
