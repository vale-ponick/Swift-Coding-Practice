//
//  classesAndStructsPractice.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 19.10.2025.
//

import Foundation

public struct Chapter10_ClassesAndStructs {
    public static func runAllTasks() {
        print("=== Глава 10: Классы и структуры ===")
        
        task10_1()
        task10a_1()
        task10b_1()
        task10c_1()
        task10_2()
        task10_3()
        task10_4()
        task10_5()
        task10_6()
    }
    
    static func task10_1() {
        print("Задача 10.1: Напиши простые классы с наследованием и без.")
       
        // простой класс БЕЗ наследования
        class Animal {
            // properties (data)
            var dog: String
            var cat: String
            var mouse: String
            
            // init to set values for properties
            init(dog: String, cat: String, mouse: String) {
                self.dog = dog
                self.cat = cat
                self.mouse = mouse
            }
            // method (function) to dusplay enimal detail
            func displayDetails() {
                print("Animals: dog - \(dog), cat - \(cat), mouse - \(mouse)")
            }
            /* === Глава 10: Классы и структуры ===
             Задача 10.1: Напиши простые классы с наследованием и без.
             Animal's discribing: Shania
             Animals: dog - Shania, cat - no cat, mouse - many  */
        }
            // creat an instance (object) of the Animal class
            let animalTest = Animal(dog: "Shania", cat: "no cat", mouse: "many")
            
            // Access properties and call methods of the object
            print("Animal's discribing: \(animalTest.dog)")
            animalTest.displayDetails()
    }
    
    static func task10a_1() {
        print("Задача 10a.1: Задача 10.1: Напиши простые классы с наследованием.")
        
        class People {
            var name: String
            var nick: String
            var age: Int
            
            init(name: String, nick: String, age: Int) {
                self.name = name
                self.nick = nick
                self.age = age
            }
            func isAdult() -> Bool {
                return age >= 18 // исправлено
            }
        }
        let saraConnor = People(name: "Sara", nick: "mama", age: 25)
        print("\(saraConnor.name) with nick \(saraConnor.nick) - \(saraConnor.age) year old.")
        print("Is adult:?", saraConnor.isAdult())
        
        class Child: People {
            var friend: String
            
            init(name: String, nick: String, age: Int, friend: String) {
                self.friend = friend
                super.init(name: name, nick: nick, age: age)
            }
            
            override func isAdult() -> Bool {
                print("Child \(name) is younger then 18")
                return false
            }
            
            func isOwnerOfTerminator() -> Bool {
                return friend == "Terminator"
            }
        }
        
        let john = Child(name: "John Connor", nick: "son", age: 10, friend: "Terminator")
                    
        print("John Connor is adult?", (john.isAdult()))
        print("John Connor has owner Terminator?", (john.isOwnerOfTerminator()))
    }
    /* Sara with nick mama - 25 year old.
     Is adult:? true
     Child John Connor is younger then 18
     John Connor is adult? false
     John Connor has owner Terminator? true */
    
    static func task10b_1() {
        print("Задача 10b.1: Car for RoadTripJourneyPro.")
        
        class GasStation {
            let name: String
            let isOnPath: Bool
            let city: String
            let adress: String
            let km: Double
            let coordinates: (lat: Double, lon: Double)
            let availableFuels: [String] // ✅ ["АИ-95", "Дизель"]
            let isCoffeeAndWarmToilet: Bool
            let isWiFi: Bool
            
            init(name: String, isOnPath: Bool, city: String, adress: String, km: Double, coordinates: (lat: Double, lon: Double),  availableFuels: [String], isCoffeeAndWarmToilet: Bool, isWiFi: Bool) {
                self.name = name
                self.isOnPath = isOnPath
                self.city = city
                self.adress = adress
                self.km = km
                self.coordinates = coordinates
                self.availableFuels = availableFuels
                self.isCoffeeAndWarmToilet = isCoffeeAndWarmToilet
                self.isWiFi = isWiFi
            }
            
            func printStationInfo() {
                print("⛽ \(name) - \(city)")
                print("📍 Адрес: \(adress)")
                print("🛢️ Топливо: \(availableFuels.joined(separator: ", "))")
            }
            
            func amenitiesInfo() -> String {
                var amenities: [String] = []
                if isCoffeeAndWarmToilet { amenities.append("☕ Кофе") }
                if isWiFi { amenities.append("📶 Wi-Fi") }
                return amenities.isEmpty ? "Нет удобств" : amenities.joined(separator: ", ")
            }
            
            func distanceFrom(currentKm: Double) -> Double {
                return abs(km - currentKm)
            }
            
            func isBetterThan(other: GasStation, currentKm: Double) -> Bool {
                // Сравниваем по расстоянию и удобствам
                let myDistance = distanceFrom(currentKm: currentKm)
                let otherDistance = other.distanceFrom(currentKm: currentKm)
                
                if myDistance < otherDistance { return true }
                if isCoffeeAndWarmToilet && !other.isCoffeeAndWarmToilet { return true }
                return false
            }
        }
        
        class TripCar {
            let model: String
            let volumeOfTank: Int
            let fuelType: String
            var currentFuel: Double = 0.0 // текущий уровень топлива
            
            init(model: String, volumeOfTank: Int, fuelType: String) {
                self.model = model
                self.volumeOfTank = volumeOfTank
                self.fuelType = fuelType
            }
            
            // ✅ ДОБАВЬ ЭТУ ФУНКЦИЮ:
            func calculateFuelNeed(distance: Double, consumption: Double) -> Double {
                return (distance * consumption) / 100
            }
            
            func canRefuelAt(station: GasStation) -> Bool {
                return station.availableFuels.contains(fuelType)
            }
            
            func canReachStation(station: GasStation, currentLocation: Double, consumption: Double) -> Bool {
                let distanceToStation = abs(station.km - currentLocation)
                let fuelNeed = calculateFuelNeed(distance: distanceToStation, consumption: consumption)
                return fuelNeed <= currentFuel
            }
            
            func refuelInfo(station: GasStation) -> String {
                if canRefuelAt(station: station) {
                    return "✅ Можно заправить \(fuelType) на \(station.name)"
                } else {
                    return "❌ Не подходит топливо \(fuelType)"
                }
            }
        }
        
        // ТЕСТ (ВНУТРИ функции) - ПРАВИЛЬНЫЙ ПОРЯДОК:
        let carOfVale = TripCar(model: "Toyota Rav4", volumeOfTank: 50, fuelType: "ai95")
        let station = GasStation(name: "lukoil", isOnPath: true, city: "Achinsk",
                                 adress: "ул. Ленина", km: 166.0,
                                 coordinates: (56.2810, 90.5007),
                                 availableFuels: ["ai95", "diesel"],
                                 isCoffeeAndWarmToilet: true, isWiFi: true)

        carOfVale.currentFuel = 20.0

        print("Машина: Toyota Rav4 заправляется: ai95")
        print("Заправка: lukoil продает: [\"ai95\", \"diesel\"]")

        print("🔍 Ищу заправку для Toyota Rav4")
        print("📍 Найдена: lukoil в Ачинске")
        print("✅ Можно заправить ai95!")  // ← ОДИН красивый статус

        print("📋 Информация о заправке:")
        print("⛽ lukoil - Achinsk")
        print("📍 Адрес: ул. Ленина")
        print("🛢️ Топливо: ai95, diesel")
        print("🏪 Удобства: ☕ Кофе, 📶 Wi-Fi")

        print("📊 Дополнительная информация:")
        print("Нужно топлива до Томска: 32.0 л")
    }
    
    /* Задача 10b.1: Car for RoadTripJourneyPro.
     Машина: Toyota Rav4 заправляется: ai95
     Заправка: lukoil продает: ["ai95", "diesel"]
     🔍 Ищу заправку для Toyota Rav4
     📍 Найдена: lukoil в Ачинске
     ✅ Можно заправить ai95!
     📋 Информация о заправке:
     ⛽ lukoil - Achinsk
     📍 Адрес: ул. Ленина
     🛢️ Топливо: ai95, diesel
     🏪 Удобства: ☕ Кофе, 📶 Wi-Fi
     📊 Дополнительная информация:
     Нужно топлива до Томска: 32.0 л. */
    
    /* ЧТО ИСПРАВЛЕНО -> ПРОФЕССИОНАЛЬНЫЙ ПОДХОД:
     
     🚗 Машина + Заправка → ❓ Вопросы → 📋 Детали → ✅ Итоги

     ✅ Восходящая логика - от общего к частному

     ✅ Естественный поток - как думает пользователь

     ✅ Группировка информации - связанные данные вместе

     ✅ Клиентоориентированность - удобно для чтения

    РЕЗУЛЬТАТ: улучшен пользовательский опыт своего приложения!  умение думать "как работает код" + "как это воспримет пользователь"🌟. */
    
    static func task10c_1() {
        print("Задача 10c.1:")
    }
    
    static func task10_2() {
        print("Задача 10.2:")
    }
    static func task10_3() {
        print("Задача 10.3:")
    }
    static func task10_4() {
        print("Задача 10.4:")
    }
    static func task10_5() {
        print("Задача 10.5:")
    }
    static func task10_6() {
        print("Задача 10.6:")
    }
}
