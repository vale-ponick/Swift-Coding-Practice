import Foundation

class Chapter10_ClassesAndStructsAdvancedLevel {
    static func runAllTasks() {
        print("=== Chapter 10 Advanced Level ===")
        print("Advanced classes and structs practice")
        
        // Пример продвинутого класса
        let advancedCar = AdvancedVehicle(brand: "Tesla", year: 2023)
        advancedCar.displayInfo()
    }
}

// Продвинутый пример класса
class AdvancedVehicle {
    var brand: String
    var year: Int
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }
    
    func displayInfo() {
        print("Advanced Vehicle: \(brand), Year: \(year)")
    }
}
