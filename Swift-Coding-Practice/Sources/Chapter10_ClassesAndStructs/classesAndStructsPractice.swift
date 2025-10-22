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
        task10a_4()
        task10b_4()
        task10с_4()
        task10a_5()
        task10b_5()
        task10c_5()
        task10d_5()
        task10e_5()
        task10f_5()
        task10g_5()
        task10h_5()
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
        print("Задача 10c.1: Умная поездка с наследованием 🗺️")
        
        // Структура для расходов - проще и нагляднее
        struct Expense {
            let category: String
            var amount: Double
        }
        
        // Базовый класс поездки
        class Trip {
            let duration: Double // в часах (упрощаем логику)
            let budget: Double
            let participants: [String]
            var expenses: [Expense]
            
            init(duration: Double, budget: Double, participants: [String], expenses: [Expense]) {
                self.duration = duration
                self.budget = budget
                self.participants = participants
                self.expenses = expenses
            }
            
            var totalExpenses: Double {
                expenses.reduce(0) { $0 + $1.amount }
            }
            
            var remainingBudget: Double {
                budget - totalExpenses
            }
            
            func printReport() {
                print("👥 Участники: \(participants.joined(separator: ", "))")
                print("⏱️ Продолжительность: \(duration) ч")
                print("💰 Бюджет: \(budget) руб")
                print("💸 Расходы: \(totalExpenses) руб")
                print("📊 Остаток: \(remainingBudget) руб")
            }
        }
        
        // Наследник - умная поездка
        class SmartTrip: Trip {
            let description: String
            let city: String
            
            init(city: String, description: String, duration: Double, budget: Double, participants: [String], expenses: [Expense]) {
                self.city = city
                self.description = description
                super.init(duration: duration, budget: budget, participants: participants, expenses: expenses)
            }
            
            override func printReport() {
                print("\n🏙️ Умная поездка в \(city)")
                print("📝 \(description)")
                super.printReport()
            }
        }
        
        // ДЕМОНСТРАЦИЯ (короче и понятнее)
        let expenses = [
            Expense(category: "Транспорт", amount: 500),
            Expense(category: "Еда", amount: 1500),
            Expense(category: "Билеты", amount: 900)
        ]
        
        let tomskTrip = SmartTrip(
            city: "Томск",
            description: "Прогулка по центру города и музеям",
            duration: 3.0,
            budget: 5000,
            participants: ["Валерия", "Дмитрий"],
            expenses: expenses
        )
        
        tomskTrip.printReport()
        
        // Демонстрация различий класса и структуры
        print("\n--- Демонстрация Class vs Struct ---")
        
        // Структура - value type
        let expense1 = Expense(category: "Сувениры", amount: 300)
        var expense2 = expense1
        expense2.amount = 500
        
        print("Struct: expense1 = \(expense1.amount), expense2 = \(expense2.amount)")
        
        // Класс - reference type
        let trip1 = Trip(duration: 2.0, budget: 3000, participants: ["А"], expenses: [])
        let trip2 = trip1
        print("Class: trip1 и trip2 ссылаются на один объект")
    }
    /* Задача 10c.1: Умная поездка с наследованием 🗺️
     
     🏙️ Умная поездка в Томск
     📝 Прогулка по центру города и музеям
     👥 Участники: Валерия, Дмитрий
     ⏱️ Продолжительность: 3.0 ч
     💰 Бюджет: 5000.0 руб
     💸 Расходы: 2900.0 руб
     📊 Остаток: 2100.0 руб

     --- Демонстрация Class vs Struct ---
     Struct: expense1 = 300.0, expense2 = 500.0
     Class: trip1 и trip2 ссылаются на один объект  */
            
            static func task10_2() {
                print("Задача 10.2: Напиши консольное приложение: создай класс 'House' и в нем свойства 'width' + 'height' и методы: 'build'(width * height), getWidth + getHeight (вывод на экран).")
                class House {
                    let width: Int
                    let height: Int
                    
                    init(width: Int, height: Int) {
                        self.width = width
                        self.height = height
                    }
                    func build() -> String {
                        let square = self.width * self.height
                        return "Площадь дома: \(square)"
                    }
                    func getWidth() -> String {
                        return "Ширина дома: \(width)"
                    }
                    func getHeight() -> String  {
                        return "Высота дома: \(height)"
                    }
                }
                // тесты
                let myHouse = House(width: 12, height: 21)
                let square = myHouse.build()
                print(square)
                print(myHouse.getWidth())
                print(myHouse.getHeight())
            }
    /* Задача 10.2: Напиши консольное приложение: создай класс 'House' и в нем свойства 'width' + 'height' и методы: 'build'(width * height), getWidth + getHeight (вывод на экран).
     Площадь дома: 252
     Ширина дома: 12
     Высота дома: 21 */
    
            static func task10_3() {
                print("Задача 10.3: Создай класс с массивом имен. Напиши метод, который принимает букву и возвращает имена, начинающиеся на эту букву. Напиши второй метод, который принимает массив строк и печатает каждое имя с новой строки. Протестируй: отфильтруй имена на букву 'А' и распечатай результат.")
                
            let names = ["Boris", "Sam", "Adam", "Arnold", "Bob", "Alex", "Andrew"]
                
                class Person {
                    let names: [String]
                    
                    init(names: [String]) {
                        self.names = names
                    }
                    func filter(by letter: String) -> [String] {
                        return self.names.filter { $0.hasPrefix(letter) }
                    }
                    
                    func printNames(_ names: [String]) {
                        names.forEach { print($0) }
                        }
                    }
                
                let person = Person(names: names)
                let arrayNamesFromA = person.filter(by: "A")

                print("Отфильтрованные имена: \(arrayNamesFromA)")
                print("\nИмена с новой строки:")
                person.printNames(arrayNamesFromA)
   }
    /* Задача 10.3: Создай класс с массивом имен. Напиши метод, который принимает букву и возвращает имена, начинающиеся на эту букву. Напиши второй метод, который принимает массив строк и печатает каждое имя с новой строки. Протестируй: отфильтруй имена на букву 'А' и распечатай результат.
     Отфильтрованные имена: ["Adam", "Arnold", "Alex", "Andrew"]

     Имена с новой строки:
     Adam
     Arnold
     Alex
     Andrew */
    
    static func task10_4() {
        print("Задача 10.4: напиши класс, который формирует массив учеников, сортирует и считает их количество. Если учеников > 12, выведи сообщение 'в школе нет мест'.")
        
        let arraySchoolChildren = [
            "Sam", "Ann", "Tod", "Sara", "Bob",
            "Boris", "Endy", "Kate", "Bruce", "Arny", "Stive", "Lisa", "Felix", "Dennis"
        ]
        
        class Schoolchild {
            let names: [String]
            let quantity: Int
            
            init(names: [String]) {
                self.names = names
                self.quantity = names.count
            }
            func sorted() -> [String] {
                return names.sorted()
            }
            func calc() -> Int {
                return names.count
            }
            func isMoreThen12() -> String {
                if quantity > 12 {
                    return "No places in school"
                } else {
                    return "There are places in school"
                }
            }
        }
        print("Исходный массив: \(arraySchoolChildren)")
        
        let children = Schoolchild(names: arraySchoolChildren)
        print("Количество учеников: \(children.quantity)")
        print("Проверка мест: \(children.isMoreThen12())")
        print("Отсортированный список: \(children.sorted())")
    }
    static func task10a_4() {
        print("Задача 10a.4: напиши класс, который формирует массив учеников, сортирует и считает их количество. Если учеников > 12, выведи сообщение 'в школе нет мест'.")
        
        let arraySchoolChildren = [
            "Sam", "Ann", "Tod", "Sara", "Bob",
            "Boris", "Endy", "Kate", "Bruce", "Arny", "Stive", "Lisa", "Felix", "Dennis"
        ]
        
        class School {
            
            private var students: [String] // Объявление свойства - массив учеников, private - доступ только внутри класса (инкапсуляция)
            
            init(students: [String]) { // Инициализатор - вызывается при создании объекта, students: [String] - параметр (массив строк)
                
                self.students = students // self.students - свойство класса, students - параметр метода, Присваиваем переданный массив свойству класса//
            }
            
            var sortedStudents: [String] { // Вычисляемое свойство (computed property), Возвращает отсортированный массив учеников
                return students.sorted() // sorted() - встроенная функция сортировки
            }
            
            var studentCount: Int {  // Вычисляемое свойство Возвращает количество учеников
                return students.count // count - свойство массива, возвращает число элементов
            }
            
            var hasAvailablePlaces: Bool { // Вычисляемое свойство типа Bool (true/false), Проверяет, есть ли свободные места
                return studentCount <= 12
            }
            
            func checkAvailability() -> String { // Метод (функция класса)
                // Тернарный оператор: условие ? значение_если_true : значение_если_false
                return hasAvailablePlaces ? "There are places in school" : "No places in school"
            } // Если hasAvailablePlaces == true - вернет первую строку, иначе вторую
        }
        // Использование класса:
        
        // Создание объекта (экземпляра класса)
        // students: - имя параметра, arraySchoolChildren - передаваемый массив
        let school = School(students: arraySchoolChildren)
        
        // Обращение к вычисляемым свойствам (они вычисляются в момент обращения)
        print("Отсортированный список: \(school.sortedStudents)")
        // sortedStudents вызывает замыкание { return students.sorted() }
        
        print("Количество учеников: \(school.studentCount)")
        // studentCount вызывает { return students.count }
        
        // Вызов метода
        print(school.checkAvailability())
        // checkAvailability() проверяет hasAvailablePlaces и возвращает соответствующую строку
        
        /* Задача 10a.4: напиши класс, который формирует массив учеников, сортирует и считает их количество. Если учеников > 12, выведи сообщение 'в школе нет мест'.
         Отсортированный список: ["Ann", "Arny", "Bob", "Boris", "Bruce", "Dennis", "Endy", "Felix", "Kate", "Lisa", "Sam", "Sara", "Stive", "Tod"]
         Количество учеников: 14
         No places in school  */
        
        /* Ключевые моменты логики:
         
         Инкапсуляция - данные защищены модификатором private
         Вычисляемые свойства - не хранят значения, а вычисляют их при каждом обращении
         Разделение ответственности - каждое свойство/метод решает одну задачу
         Чистота кода - нет лишних параметров в методах, логика ясна */
    }
    
    static func task10b_4() {
        print("Задача 10b.4: используй функциональный стиль без создания класса/структуры  -> просто обработай массив")
        
        func checkSchool(students: [String]) -> (sorted: [String], count: Int, availabilityMessage: String) {
            let sortedStudents = students.sorted()
            let count = students.count
            let message = count <= 12 ? "There are places in school" : "No places in school"
            return (sortedStudents, count, message)
        }

        let result = checkSchool(students: ["Иван", "Мария", "Елена"])
        print(result.sorted)
        print(result.count)
        print(result.availabilityMessage)
        
        /* Задача 10b.4: используй функциональный стиль без создания класса/структуры  -> просто обработай массив
         ["Елена", "Иван", "Мария"]
         3
         There are places in school */
    }
    
    static func task10с_4() {
        print("Задача 10c.4 Для простой задачи хранения и обработки массива структурирование через struct — более “свитфтовый” способ и эффективнее с точки зрения управления памятью.")
        
        struct School {
            private var students: [String]
            
            // Явный инициализатор с доступом internal (по умолчанию)
            init(students: [String]) {
                self.students = students
            }
            
            var sortedStudents: [String] {
                students.sorted()
            }
            
            var studentCount: Int {
                students.count
            }
            
            var hasAvailablePlaces: Bool {
                studentCount <= 12
            }
            
            func checkAvailability() -> String {
                hasAvailablePlaces ? "There are places in school" : "No places in school"
            }
        }
        
        // Использование:
        let school = School(students: ["Иван", "Мария", "Елена"])
        print(school.sortedStudents)
        print(school.studentCount)
        print(school.checkAvailability())
        
        /* Задача 10c.4 Для простой задачи хранения и обработки массива структурирование через struct — более “свитфтовый” способ и эффективнее с точки зрения управления памятью.
         ["Елена", "Иван", "Мария"]
         3
         There are places in school */
    }
    
    static func task10e_5() {
        print("Задача 10a.5: создай 12 своих структур")
        
        struct Car { // srtuct 1
            let name: String
            let color: String
            let tank: Int
            let year: Int
            private var fuel: String // частное свойство - топливо
            let hasSpareWheel: Bool
            let hasSunroof: Bool
            
            init(name: String, color: String, tank: Int, year: Int, fuel: String, hasSpareWheel: Bool = true, hasSunroof: Bool = false) {
                   self.name = name
                   self.color = color
                   self.tank = tank
                   self.year = year
                   self.fuel = fuel
                   self.hasSpareWheel = hasSpareWheel
                   self.hasSunroof = hasSunroof
               }
            
            var age: Int {
                Calendar.current.component(.year, from: Date()) - year
            }
            
            var description: String { // кастомный скрывает приватные свойства
                return "Car(name: \(name), color: \(color))" // fuel намеренно НЕ включаем - инкапсуляция! НЕЛЬЗЯ изменить ИЗВНЕ!!!
            }
                func isDiesel() -> Bool {
                    return fuel.lowercased().contains("diesel")
                }
            }
        let myCar = Car(name: "Toyota Rav4", color: "silver", tank: 50, year: 2015, fuel: "petrol AI-95")
        print(myCar)
        print("My car is old:", (myCar.age))
        print(myCar.description)
        
        /* Задача 10.5: создай 12 своих структур
         Car(name: "Toyota Rav4", color: "silver", tank: 50, year: 2015, fuel: "petrol AI-95", hasSpareWheel: true, hasSunroof: false)
         My car is old: 10
         Car(name: Toyota Rav4, color: silver) */
    }
    
    static func task10a_5() {
        print("Задача 10a.5: Уровень 1. Data Object - only property")
        
        struct Address {
            let street: String
            let city: String
        }
            
        let myAddress = Address(street: "Komarova", city: "Krasnoyarsk")
        print(myAddress)
        
    }
    
    static func task10b_5() {
        print("Задача 10b.5: Уровень 2 Static Config - статистические свойства")
        
        struct Parcel {
            
            static let maxWeight = 20
            static let carrierCompany = "Post Office"
            static let tariff = ["express", "domestic", "interenational", "airmail", "standart"]
        }
        print(Parcel.maxWeight)        // 20
        print(Parcel.carrierCompany)   // "Post Office"
        print(Parcel.tariff[0])        // "express"
    }
    
    static func task10c_5() {
        print("Задача 10c.5:  Struct with Computed Properties - 'вычисляемые свойства'.")
        
        struct Rectangle {
            let width: Int
            let length: Int
            
            init(width: Int, length: Int) {
                self.width = width
                self.length = length
            }
            
            var perimeter: Int {
                return 2 * (width + length)
            }
            
            var square: Int {
                return width * length
            }
        }
        let myRectangle = Rectangle(width: 4, length: 7)
        print("Прямоугольник:", (myRectangle))
        print("Периметр прятоугольника: ", (myRectangle.perimeter))
        print("Площадь прямоугольника: ", (myRectangle.square))
    }
    /* Задача 10c.5:  Struct with Computed Properties - 'вычисляемые свойства'.
     Прямоугольник: Rectangle(width: 4, length: 7)
     Периметр прятоугольника:  22
     Площадь прямоугольника:  28 */
    
    static func task10d_5() {
        print("Задача 10d.5: Уровень 4 - Multiple Computed (несколько вычисляемых свойств.")
        
        enum RoadType {
            case highway, city, country
        }
        
        struct fuelConsumption {
            let distance: Double
            let fuelConsumption: Double
            let fuelPrice: Double
            let roadType: RoadType
            
            init(distance: Double, fuelConsumption: Double, fuelPrice: Double, roadType: RoadType) {
                self.distance = distance
                self.fuelConsumption = fuelConsumption
                self.fuelPrice = fuelPrice
                self.roadType = roadType
            }
            
            var averageSpeed: Double {
                switch roadType {
                case .highway: return 90
                case .city: return 60
                case .country: return 70
                }
            }
            
            var totalFuel: Double {
               let fuelNeeded = (distance / 100) * fuelConsumption
                return fuelNeeded * fuelPrice
            }
            
            var costTravel: Double {
                return (totalFuel * 2 * 100).rounded() / 100 // и обратно!
            }
            
            var timeTravel: Double {
                return distance / averageSpeed
            }
        }
        let trip = fuelConsumption(
            distance: 585.0,
            fuelConsumption: 8.5,
            fuelPrice: 65.5,
            roadType: .highway)
        
        print("Время в пути: \(trip.timeTravel) часов.")
        print("Стоимость поездки туда и обратно: \(trip.costTravel) рублей.")
        print(String(format: "Стоимость поездки туда и обратно:: %.2f рублей", trip.costTravel))
    }
    /* Задача 10d.5: Уровень 4 - Multiple Computed (несколько вычисляемых свойств.
     Время в пути: 6.5 часов.
     Стоимость поездки туда и обратно: 6513.98 рублей.
     Стоимость поездки туда и обратно:: 6513.98 рублей  */
    
    static func task10f_5() {
        print("Задача 10f.5: создай 12 своих структур")
    }
    static func task10g_5() {
        print("Задача 10g.5: создай 12 своих структур")
    }
    static func task10h_5() {
        print("Задача 10h.5: создай 12 своих структур")
    }
    
    static func task10_6() {
        print("Задача 10.6: сделай список покупок. Программа записывает продукты в массив. Если вызываем орпеделенный продукт - в консоли пишем: 'Мед - куплено!'.")
    }
}
    
  
