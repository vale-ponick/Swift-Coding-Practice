//
//  Dictionaries_Practice.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 16.09.2025.

import Foundation

public struct Chapter4_Dictionaries {
    public static func runAllTasks() {
        print("=== Глава 4: Словари ===")
        task4_1()
        task4_2()
        task4_3()
        task4_4()
        task4_5()
        // Dictionaries: Advanced Level
        task4a_1()
        task4a_2()
        task4a_3()
        task4a_4()
        task4a_5()
        
    } // Добавляй новые задачи тут
    
    static func task4_1() {
        print("Задача 4.1: Создай 5 разных Dictionaries с разными типами данных. Один из них должен содержать ВСЕ месяцы года на русском. Второй - на английском.")
        
        let seasons = [1: "spring", 2: "summer", 3: "autumn", 4: "winter"]
        print("Все сезоны года: \(seasons)") // Все сезоны года: [2: "summer", 1: "spring", 4: "winter", 3: "autumn"]
        
        let monthsLatin = [
            1: "january",
            2: "february",
            3: "march",
            4: "april",
            5: "may",
            6: "june",
            7: "july",
            8: "august",
            9: "september",
            10: "october",
            11: "november",
            12: "december"
        ]
        
        print("Месяцы на английском: \(monthsLatin[1] ?? "unknown")") // словарь возвращает String?, а не массив. Нужно ?? "unknown" или ?? "" // Месяцы на английском: january
        
        let monthsCirillic = [
            1: "январь",
            2: "февраль",
            3: "март",
            4: "апрель",
            5: "май",
            6: "июнь",
            7: "июль",
            8: "август",
            9: "сентябрь",
            10: "октябрь",
            11: "ноябрь",
            12: "декабрь"
        ]
        print("Месяцы на русском:")
        for (number, name) in monthsCirillic.sorted(by: { $0.key < $1.key }) {
            print("\(number) - \(name)")
        } /* Месяцы на русском:
           1 - январь
           2 - февраль
           3 - март
           4 - апрель
           5 - май
           6 - июнь
           7 - июль
           8 - август
           9 - сентябрь
           10 - октябрь
           11 - ноябрь
           12 - декабрь */
        
        let daysWeek = [
            "Su": "Sunday",
            "Mo": "Monday",
            "Tu": "Tuesday",
            "We": "Wednesday",
            "Th": "Thursday",
            "Fr": "Friday",
            "Sa": "Saturday"
        ]
        // Или красиво:
        for (shortName, fullName) in daysWeek.sorted(by: { $0.key < $1.key }) {
            print("\(shortName) - \(fullName)")
        } /* Su: Sunday
           Mo: Monday
           Fr: Friday
           Sa: Saturday
           Tu: Tuesday
           We: Wednesday
           Th: Thursday */
        
        let monthDays = [1: 31, 2: 28, 3: 31, 4: 30] // числовые значения
        print("Дни месяца: \(monthDays[1] ?? 0)") //
        
        let monthHasHolidays = [1: true, 2: false, 12: true] // булевы значения
        print("Есть ли в месяце каникулы? - \(monthHasHolidays)") // Есть ли в месяце каникулы? - [2: false, 12: true, 1: true]
        
        let ukHolidays = [
            1: ["New Year's Day", "Burn's Night"],
            3: ["St. David's Day", "Mother's Day"],
            4: ["Easter", "St. George's Day"],
            5: ["May Day", "Spring Bank Holiday"],
            6: ["Queen's Official Birthday"],
            7: ["Orange Day"],
            8: ["Summer Bank Holiday"],
            11: ["Remembrance Day", "St. Andrew's Day"],
            12: ["Christmas Day", "Boxing Day"]
        ]
        let usHolidays = [
            1: ["New Year's Day", "Martin Luther King Jr. Day"],
            2: ["Presidents' Day", "Valentine's Day"],
            3: ["St. Patrick's Day"],
            5: ["Memorial Day", "Mother's Day"],
            6: ["Father's Day"],
            7: ["Independence Day"],
            9: ["Labor Day"],
            10: ["Columbus Day", "Halloween"],
            11: ["Veterans Day", "Thanksgiving"],
            12: ["Christmas Day"]
        ]
        // Сравнение праздников
        print("UK January: \(ukHolidays[1] ?? [])")
        // ["New Year's Day", "Burn's Night"]
        
        print("US January: \(usHolidays[1] ?? [])")
        // ["New Year's Day", "Martin Luther King Jr. Day"]
        
        // Уникальные британские праздники
        let uniqueUK = ukHolidays.values.flatMap { $0 }.filter { !usHolidays.values.flatMap { $0 }.contains($0) }
        print("Unique UK holidays: \(uniqueUK)")
        // ["Burn's Night", "St. David's Day", "St. George's Day", "May Day", "Queen's Official Birthday", "Orange Day", "Summer Bank Holiday", "Remembrance Day", "St. Andrew's Day", "Boxing Day"]
    } // Теперь видна культурная разница! 😊🇬🇧🇺🇸
    
    static func task4_2() {
        print("Задача 4.2: Собери все ключи и значения каждого Dictionaries и распечатай в консоль.")
        
        let seasons = [1: "spring", 2: "summer", 3: "autumn", 4: "winter"]
        print("Все ключи словаря - \(seasons.keys)") // Все ключи словаря - [2, 3, 1, 4]
        print("Все значения словаря - \(seasons.values)") // Все значения словаря - ["summer", "autumn", "spring", "winter"]
        
        let monthsLatin = [
            1: "january",
            2: "february",
            3: "march",
            4: "april",
            5: "may",
            6: "june",
            7: "july",
            8: "august",
            9: "september",
            10: "october",
            11: "november",
            12: "december"
        ]
        print("Все ключи - \(monthsLatin.keys.sorted())") // Все ключи - [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        let sortedValues = monthsLatin.keys.sorted().compactMap { monthsLatin[$0] }
        print("Значения по порядку ключей: \(sortedValues)") // Значения по порядку ключей: ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
        
        let ukHolidays = [
            1: ["New Year's Day", "Burn's Night"],
            3: ["St. David's Day", "Mother's Day"],
            4: ["Easter", "St. George's Day"],
            5: ["May Day", "Spring Bank Holiday"],
            6: ["Queen's Official Birthday"],
            7: ["Orange Day"],
            8: ["Summer Bank Holiday"],
            11: ["Remembrance Day", "St. Andrew's Day"],
            12: ["Christmas Day", "Boxing Day"]
        ]
        print("Все ключи - \(ukHolidays.keys.sorted())") // Все ключи - [1, 3, 4, 5, 6, 7, 8, 11, 12]
        print("Все значения - \(ukHolidays.keys.sorted().compactMap { ukHolidays[$0] })") // Все значения - [["New Year\'s Day", "Burn\'s Night"], ["St. David\'s Day", "Mother\'s Day"], ["Easter", "St. George\'s Day"], ["May Day", "Spring Bank Holiday"], ["Queen\'s Official Birthday"], ["Orange Day"], ["Summer Bank Holiday"], ["Remembrance Day", "St. Andrew\'s Day"], ["Christmas Day", "Boxing Day"]]
    }
    
    static func task4_3() {
        print("Задача 4.3: Создай пустой Dictionary и через условный оператор 'if' проверь он пуст или нет. Если пустой, то в условии добавь в него пару значений.")
        var emptyDict: [String: [String]] = [:]
        if emptyDict.isEmpty == true {
            emptyDict = [
                "Abba": ["Dancing Queen", "Money, Money, Money", "Waterloo"],
                "Boney-M": ["Daddy Cool", "Rasputin", "River of Babylon", "One-Way Ticket"]
            ]
            print("Добавлены значения: \(emptyDict)") // Добавлены значения: ["Boney-M": ["Daddy Cool", "Rasputin", "River of Babylon", "One-Way Ticket"], "Abba": ["Dancing Queen", "Money, Money, Money", "Waterloo"]]
        }
    }
    
    static func task4_4() {
        print("Задача 4.4:Создай словарь - ключ 'иномарка', значение - 'название машины'.")
        
        let cars = [
            "forein car": ["BMW", "Audi", "Volkswagen", "Toyota"]
        ]
        print("Иномарки: - \(cars)") // Иномарки: - ["forein car": ["BMW", "Audi", "Volkswagen", "Toyota"]]
        
    }
    static func task4_5() {
        print("Задача 4.1: Добавь в него значение по ключу - 'отечественная'. Распечатай ключи и значения в консоль. Затем отдельно - только значения. Удали из словаря иномарку по ключу(двумя способами: через nil и removeValue()).")
        var cars = [
            "foreign car": ["BMW", "Audi", "Volkswagen", "Toyota"]
        ]
        cars.updateValue(["Moskvich", "GAZ"], forKey: "domestic car")
        print(cars) // ["forein car": ["BMW", "Audi", "Volkswagen", "Toyota"], "domestic car": ["Moskvich", "GAZ"]]
        print(cars.values) // [["Moskvich", "GAZ"], ["BMW", "Audi", "Volkswagen", "Toyota"]]
        
        cars.removeValue(forKey: "foreign car")
        print(cars) // ["domestic car": ["Moskvich", "GAZ"]]
        
        cars.updateValue(["BMW", "Audi", "Volkswagen", "Toyota"], forKey: "foreign car")
        cars["foreign car"] = nil
        print(cars) // ["domestic car": ["Moskvich", "GAZ"]]
    }
    
    // Dictionaries: Advanced Level
    
    static func task4a_1() {
        print("Задача 4a.1: Создай словарь, где ключ - звание моряка, а значение - его приветствие.")
        
        let navalGreetings = [
            "Seaman": "Ahoy, Captain!",
            "Boatswain": "Aye aye, sir!",
            "Lieutenant": "Good day, Lieutenant!",
            "Captain": "Captain on deck!",
            "Admiral": "Three cheers for the Admiral!"
        ]
        
        print("Морские приветствия:")
        for (rank, greeting) in navalGreetings.sorted(by: { $0.key < $1.key }) {
            print("\(rank): \(greeting)")
        }
        
        // Дополнительно: случайное приветствие
        let randomRank = navalGreetings.keys.randomElement()!
        print("\nСлучайное приветствие:")
        print("\(randomRank): \(navalGreetings[randomRank]!)")
    }
    /*   Задача 4a.1: Создай словарь, где ключ - звание моряка, а значение - его приветствие.
     Морские приветствия:
     Admiral: Three cheers for the Admiral!
     Boatswain: Aye aye, sir!
     Captain: Captain on deck!
     Lieutenant: Good day, Lieutenant!
     Seaman: Ahoy, Captain!
     
     Случайное приветствие:
     Lieutenant: Good day, Lieutenant!   */
    
    static func task4a_2() {
        print("Задача 4a.2: В цикле пройдись по ВСЕМ ключам и распечатай звание каждого моряка. ")
        let navalGreetings = [
            "Seaman": "Ahoy, Captain!",
            "Boatswain": "Aye aye, sir!",
            "Lieutenant": "Good day, Lieutenant!",
            "Captain": "Captain on deck!",
            "Admiral": "Three cheers for the Admiral!"
        ]
        
        print("Звание каждого моряка:")
        for (rank, _) in navalGreetings.sorted(by: { $0.key < $1.key }) {
            print("\(rank)")
        }
    }
    /* Задача 4a.3: В цикле пройдись по ВСЕМ ключам и распечатай звание каждого моряка.
     Звание каждого моряка:
     Admiral
     Boatswain
     Captain
     Lieutenant
     Seaman  */
    
    static func task4a_3() {
        print("Задача 4a.3: В цикле пройдись по ВСЕМ ключам и распечатай приветствие каждого моряка. ")
        let navalGreetings = [
            "Seaman": "Ahoy, Captain!",
            "Boatswain": "Aye aye, sir!",
            "Lieutenant": "Good day, Lieutenant!",
            "Captain": "Captain on deck!",
            "Admiral": "Three cheers for the Admiral!"
        ]
        
        print("Приветствие каждого моряка:")
        for (_, greeting) in navalGreetings.sorted(by: { $0.key < $1.key }) {
            print("\(greeting)")
        }
    }
    /*  Задача 4a.3: В цикле пройдись по ВСЕМ ключам и распечатай приветствие каждого моряка.
     Приветствие каждого моряка:
     Ahoy, Captain!
     Good day, Lieutenant!
     Captain on deck!
     Aye aye, sir!
     Three cheers for the Admiral! */
    
    static func task4a_4() {
        print("Задача 4a.4: Отсортируй словарь так, чтобы звания шли по алфавиту.")
        
        let navalGreetings = [
            "Seaman": "Ahoy, Captain!",
            "Boatswain": "Aye aye, sir!",
            "Lieutenant": "Good day, Lieutenant!",
            "Captain": "Captain on deck!",
            "Admiral": "Three cheers for the Admiral!"
        ]
        
        print("Звания моряков по алфавиту:")
        for (ranc, _) in navalGreetings.sorted(by: { $0.key.first ?? " " < $1.key.first ?? " " }) {
            print("\(ranc)")
        }
    }
    /* Задача 4a.4: Отсортируй словарь так, чтобы звания шли по алфавиту.
     Звания моряков по алфавиту:
     Admiral
     Boatswain
     Captain
     Lieutenant
     Seaman */
    
    static func task4a_5() {
        print("Задача 4a.5: Создай логическую проверку: если ключ словаря - адмирал, то скажи, что это адмирал. Сделай тоже самое со ВСЕМИ ключами.")
        let navalGreetings = [
            "Seaman": "Ahoy, Captain!",
            "Boatswain": "Aye aye, sir!",
            "Lieutenant": "Good day, Lieutenant!",
            "Captain": "Captain on deck!",
            "Admiral": "Three cheers for the Admiral!"
        ]
        for (rank, _) in navalGreetings {
            if rank == "Admiral" {
                print("Это адмирал")
            } else if rank == "Lieutenant" {
                    print("Это лейтенант")
            } else if rank == "Captain" {
                print("Это капитан")
            } else if rank == "Boatswain" {
                print("Это боцман")
            } else {
                print("Это матрос")
            }
            
            for (rank, _) in navalGreetings {
                switch rank {
                case "Admiral": print("Это адмирал")
                case "Lieutenant": print("Это лейтенант")
                case "Captain": print("Это капитан")
                case "Boatswain": print("Это боцман")
                default: print("Это матрос")
                }
            }
        }
    }
}
    /* Задача 4a.5: Создай логическую проверку: если ключ словаря - адмирал, то скажи, что это адмирал. Сделай тоже самое со ВСЕМИ ключами.
     Ошибка
     Ошибка
     Ошибка
     Ошибка
     Это адмирал
     
     Задача 4a.5: Создай логическую проверку: если ключ словаря - адмирал, то скажи, что это адмирал. Сделай тоже самое со ВСЕМИ ключами.
     Это боцман
     Это лейтенант
     Это адмирал
     Это матрос
     Это капитан    */


