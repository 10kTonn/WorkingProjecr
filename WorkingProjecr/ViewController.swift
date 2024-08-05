//
//  ViewController.swift
//  WorkingProjecr
//
//  Created by User on 30.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Optional:")
        optionalTask()
        print("Tuples:")
        tuplesTask()
        print("Array:")
        arrayTask()
        print("Dictionary:")
        dictionaryTask()
        print("String:")
        stringTask()
        print("Enum:")
        enumTask()
        print("Class:")
        classTask()
    }
    // MARK: - Optional
    func optionalTask() {
        let stringVar1 = "1248949"
        let stringVar2 = "h52kl42n"
        let doubleVar1: Double = 10
        let doubleVar2 = 13.3
        
        let intStringVar1: Int? = Int(stringVar1)
        let intStringVar2: Int? = Int(stringVar2)
        let intDoubleVar1: Int? = Int(doubleVar1)
        let intDoubleVar2: Int? = Int(doubleVar2)
        
        let resultArray = [intStringVar1 ?? 0, intStringVar2 ?? 0, intDoubleVar1 ?? 0, intDoubleVar2 ?? 0]
        print("Result: \(resultArray.max() as Any)")
    }
    
    // MARK: - Tuples
    func tuplesTask() {
        let personTuples1 = (name: "Alex", age: 21, gender: "Male")
        let personTuples2 = (name: "Bob", age: 35, gender: "Male")
        let personTuples3 = (name: "Michael", age: 42, gender: "Female")
        let personTuples4 = (name: "Kristin", age: 19, gender: "Female")
        let personTuples5 = (name: "Donald", age: 72, gender: "Male")
        
        let anyPerson = [personTuples1, personTuples2, personTuples3, personTuples4]
        
        func printPersonTuples(personTuples: (name: String, age: Int, gender: String)) {
            print("Name: \(personTuples.name), Age: \(personTuples.age), Gender: \(personTuples.gender)")
        }
        
        for item in anyPerson {
            printPersonTuples(personTuples: item)
        }
        
        func whoIsOlder(firstPerson: (name: String, age: Int, gender: String),
                        secondPerson: (name: String, age: Int, gender: String)) {
            if firstPerson.age == secondPerson.age {
                print ("Возраст совпадает: \(firstPerson.age)")
            } else if firstPerson.age > secondPerson.age {
                print("\(firstPerson.name) старше чем \(secondPerson.name) на \(firstPerson.age - secondPerson.age) лет")
            } else {
                print("\(secondPerson.name) старше чем \(firstPerson.name) на \(secondPerson.age - firstPerson.age) лет")
            }
        }
        
        whoIsOlder(firstPerson: personTuples1, secondPerson: personTuples2)
        whoIsOlder(firstPerson: personTuples4, secondPerson: personTuples5)
    }
    
    // MARK: - Array
    func arrayTask() {
        var intRandomArray: [Int] = []
        for i in 0...9 {
            intRandomArray.append(Int.random(in: 1...50))
        }
        intRandomArray.forEach {number in
            print(number)
        }
        func intArrayUpper30(arr: [Int]) -> [Int]{
            let intRandomArrayUpper30 = arr.filter {$0 > 30}
            return intRandomArrayUpper30
        }
        var arrayUpper30 = intArrayUpper30(arr: intRandomArray)
        print(arrayUpper30)
        
        func intArrayToStringArray(arr: [Int]) {
            let stringRandomArray = arr.map({(number) in
                return String(number)})
            print(stringRandomArray)
        }
        intArrayToStringArray(arr: intRandomArray)
        
        func summArrayElement(arr: [Int]) -> Int?{
            if arr.isEmpty {return nil}
            var sum = 0
            arr.forEach({sum += $0})
            return sum
        }
        let resultSummArrayElement = summArrayElement(arr: intRandomArray)!
        print(resultSummArrayElement)
        
        func arrayReduceAverage(reducedArray: [Int], arrayForAverage: [Int]) -> [Int] {
            var resultArray: [Int] = []
            let average = (summArrayElement(arr: arrayForAverage)!) / arrayForAverage.count
            reducedArray.forEach({resultArray.append($0 - average)})
            return resultArray
        }
        let resultReduce = arrayReduceAverage(reducedArray: intRandomArray, arrayForAverage: arrayUpper30)
        print(resultReduce)
    }
    
    // MARK: - Dictionary
    func dictionaryTask() {
        let monthOfYear: [String : (days: Int, position: Int)] = ["Январь" : (days: 31, position: 1),
                                                                  "Февраль" : (days: 28, position: 2),
                                                                  "Март" : (days: 31, position: 3),
                                                                  "Апрель" : (days: 30, position: 4),
                                                                  "Май" : (days: 31, position: 5),
                                                                  "Июнь" : (days: 30, position: 6),
                                                                  "Июль" : (days: 31, position: 7),
                                                                  "Август" : (days: 31, position: 8),
                                                                  "Сентябрь" : (days: 30, position: 9),
                                                                  "Октябрь" : (days: 31, position: 10),
                                                                  "Ноябрь" : (days: 30, position: 11),
                                                                  "Декабрь" : (days: 31, position: 12)]
        
        monthOfYear.forEach({print("Месяц: \($0), Дней: \($1.days), Номер в году: \($1.position)")})
        
        func summDays(months: [String : (days: Int, position: Int)]) -> Int {
            var result = 0
            months.forEach({result += $1.days})
            return result
        }
        let summDaysOfYear = summDays(months: monthOfYear)
        print(summDaysOfYear)
    }
    
    // MARK: - String
    
    func stringTask(){
        let arrayString = ["kwejbjwe", "wejhfuwe", "ojojoo", "kwenfkjwle", "woenfowe"]
        func unionString(array: [String]) -> String {
            var resultString = ""
            array.forEach({
                let temp = $0
                resultString += temp.uppercased() + " "
            })
            return resultString
        }
        let unionStringFromArray = unionString(array: arrayString)
        print(unionStringFromArray)
        
        func splitStringToArray(str: String) -> [String] {
            var resultArray: [String]
            resultArray = str.components(separatedBy: " ")
            return resultArray
        }
        
        let newArray = splitStringToArray(str: unionStringFromArray)
        print(newArray)
        
        func maxLenthStringInArray(array: [String]) -> String {
            var resultString = ""
            for index in array {
                if index.count > resultString.count{
                    resultString = index
                }
            }
            return resultString
        }
        let maxlenthString = maxLenthStringInArray(array: arrayString)
        print(maxlenthString)
        
        func mirrorString(str: String) -> String {
            var resultNonRepeat: [Character] = []
            for char in str {
                if !resultNonRepeat.contains(char) {
                    resultNonRepeat.append(char)
                }
            }
            var newArrayChar: [Character] = []
            resultNonRepeat.forEach({newArrayChar.insert($0, at: 0)})
            return String(newArrayChar)
        }
        print(mirrorString(str: "aaklkkkejrii"))
        
        func intFromString(str: String) -> [String] {
            var resultArray: [String] = []
            var temp: String = ""
            for char in str {
                if char.isNumber {
                    temp += String(char)
                }
                if !temp.isEmpty && !char.isNumber {
                    resultArray.append(temp)
                    temp = ""
                }
            }
            if !temp.isEmpty {resultArray.append(temp)}
            return resultArray
        }
        print(intFromString(str: "hvg32hnk111ksdfvk54nbk"))
    }
    
    //MARK: ENUM
    
    func enumTask() {
        enum MenuRestaraunt {
            case cola(volume: Int, isAvailable: Bool = Bool.random())
            case potato(weigth: Int, isAvailable: Bool = Bool.random())
            case salat(weigth: Int, isAvailable: Bool = Bool.random())
            case burger(count: Int, isAvailable: Bool = Bool.random())
            case pizza(count: Int, isAvailable: Bool = Bool.random())
            
            func printMenu() {
                switch self{
                case .cola(let volume, let flag):
                    if flag == false {
                        print("Извините, нет в наличии")
                        break
                    }
                    print("Заказали колу \(volume) грамм")
                case .potato(let volume, let flag):
                    if flag == false {
                        print("Извините, нет в наличии")
                        break
                    }
                    print("Заказали картошку \(volume) грамм")
                case .salat(let volume, let flag):
                    if flag == false {
                        print("Извините, нет в наличии")
                        break
                    }
                    print("Заказали салат \(volume) грамм")
                case .burger(let volume, let flag):
                    if flag == false {
                        print("Извините, нет в наличии")
                        break
                    }
                    print("Заказали бургер \(volume) штук")
                case .pizza(let volume, let flag):
                    if flag == false {
                        print("Извините, нет в наличии")
                        break
                    }
                    print("Заказали пиццу \(volume) штук")
                }
            }
        }
        var order: [MenuRestaraunt] = [.cola(volume: 100), .burger(count: 3), .pizza(count: 1)]
        order.forEach({$0.printMenu()})
    }
    
    //MARK: Class and Struct
    func classTask() {
        class Employee {
            var firstName: String
            var lastName: String
            var isWork: Bool
            
            init(firstName: String, lastName: String, isWork: Bool) {
                self.firstName = firstName
                self.lastName = lastName
                self.isWork = isWork
            }
        }
        
        let employes = [Employee(firstName: "Bob", lastName: "Been", isWork: Bool.random()),
                        Employee(firstName: "Andy", lastName: "Pitta", isWork: Bool.random()),
                        Employee(firstName: "Igor", lastName: "Kita", isWork: Bool.random()),
                        Employee(firstName: "Andry", lastName: "Lrlrl", isWork: Bool.random()),
                        Employee(firstName: "Sam", lastName: "Orfon", isWork: Bool.random())]
     
        // Это функция сортировки, по моему это какоето говно я придумал, но вроде работает
        func sortEmployes(arg: [Employee]) -> [Employee] {
            var trueArr: [Employee] = []
            var falseArg: [Employee] = []
            arg.forEach({
                if $0.isWork == true{
                    trueArr.append($0)
                } else {
                    falseArg.append($0)
                }
            })
            let trueResult = trueArr.sorted {(a, b) -> Bool in
                return a.lastName < b.lastName
            }
            let falseResut = falseArg.sorted {(a, b) -> Bool in
                return a.firstName < b.firstName
            }
            return trueResult + falseResut
        }
        
        let newArrEmployes = sortEmployes(arg: employes)
        newArrEmployes.forEach({
            print($0.firstName, $0.lastName, $0.isWork)
        })
    }
}
