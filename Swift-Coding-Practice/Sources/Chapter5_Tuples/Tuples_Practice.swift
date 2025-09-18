//
//  Tuples_Practice.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 16.09.2025.
//
import Foundation

public struct Chapter5_Tuples {
    public static func runAllTasks() {
        print("=== Глава 5: Кортежи ===")
        task5_1()
        task5_2()
        task5_3()
        task5_4()
        task5_5()
        // Tuples Practice: Advanced Level
        task5a_1()
        task5a_2()
        task5a_3()
        task5a_4()
        task5a_5()
        
    } // Добавляй новые задачи тут
    
    static func task5_1() {
        print("Задача 5.1: Создай кортеж с 3-5 значениями. Выведи их в консоль 3 способами.")
        
        // Простой кортеж: книга: (название, автор, год)
        let book = ("Treasure Island", "Robert Louis Stevenson", 1883)

        // Именованный кортеж
        let ship = (name: "Hispaniola", type: "two-masted sailing schooner", crew: 50, isSailing: true)

        // Возврат из функции
        func getCoordinatesTreasureIsland() -> (x: Double, y: Double) {
            
            return (21.9216, -83.051)  // ✅ Координаты с десятичными долями
        }
        /* 💡 Три способа вывода кортежа:
                    По индексу — book.0, book.1, book.2
                    По имени (если именованный) — ship.name, ship.type
                    Распаковка — let (title, author, year) = book */
        print("Книга - \(book.0), автор - \(book.1), год издания - \(book.2).")
        print("Название судна - \(ship.name), тип судна - \(ship.type), экипаж - \(ship.crew), парусное судно - \(ship.isSailing).")
        print("")
        // Распаковка кортежа в отдельные переменные
        let (title, author, year) = book
        print("Книга: \(title), автор: \(author), год: \(year)")

        // Или для координат:
        let (x, y) = getCoordinatesTreasureIsland()
        print("Координаты 'острова Сокровищ': x: \(x), y: \(y)")
    }
    /* === Глава 5: Кортежи ===
     Задача 5.1: Создай кортеж с 3-5 значениями. Выведи их в консоль 3 способами.
     Книга - Treasure Island, автор - Robert Louis Stevenson, год издания - 1883.
     Название судна - Hispaniola, тип судна - two-masted sailing schooner, экипаж - 50, парусное судно - true.

     Книга: Treasure Island, автор: Robert Louis Stevenson, год: 1883
     Координаты 'острова Сокровищ': x: 21.9216, y: -83.051 */
    
    static func task5_2() {
        print("Задача 5.2: Представим, мы - сотрудники ДПС, есть какое-то количество нарушителей. Задача: создать кортеж с тремя параметрами - 1) превышение скорости: количество задержанных; 2) вождение в нетрезвом виде: количество задержанных; 3) водители без прав: количество задержанных. Распечатай всех водителей в консоль.")
        
        let protocolPolice =
            (("speeding", 21), ("drunk driver", 7), ("driver without a license", 12))
        let count = protocolPolice.0.1 + protocolPolice.1.1 + protocolPolice.2.1
        print("Количество всех задержанных водителей - \(count)") // 40
        print("Превышение скорости - \(protocolPolice.0.1)")
        print("Вождение в нетрезвом виде - \(protocolPolice.1.1)")
        print("Водители без прав - \(protocolPolice.2.1)")
        
        
        /* Задача 5.2: Представим, мы - сотрудники ДПС, есть какое-то количество нарушителей. Задача: создать кортеж с тремя параметрами - 1) превышение скорости: количество задержанных; 2) вождение в нетрезвом виде: количество задержанных; 3) водители без прав: количество задержанных. Распечатай всех водителей в консоль.
         Количество всех задержанных водителей - 40
            Превышение скорости - 21
            Вождение в нетрезвом виде - 7
            Водители без прав - 12 */
    }
    static func task5_3() {
        print("Задача 5.3: Выведи каждый параметр в консоль 3-мя способами.")
        /* 💡 Три способа вывода кортежа:
         По индексу — book.0, book.1, book.2
         По имени (если именованный) — ship.name, ship.type
         Распаковка — let (title, author, year) = book */
        let protocolPolice = (
            speeding: ("Превышение скорости", 21),
            drunk: ("Вождение в нетрезвом виде", 7),
            noLicense: ("Водители без прав", 12)
        )
        
        print("По индексу: водители без прав - \(protocolPolice.noLicense.1)")
        print("По имени: вождение в нетрезвом виде - \(protocolPolice.drunk.1)")
        
        print("Распаковка кортежа в отдельные свойства:")
        
        let (speeding, drunk, noLicense) = protocolPolice
        print("Превышение скорости: \(speeding.1), Вождение в нетрезвом виде: \(drunk.1), Водители без прав: \(noLicense.1)")
        
        // вложенная распаковка:
        
        let (offence, number) = noLicense
        print(" \(noLicense.0): \(number) случаев") // Водители без прав: 12 случаев
    }
    
    /* Задача 5.3: Выведи каждый параметр в консоль 3-мя способами.
            По индексу: водители без прав - 12
            По имени: вождение в нетрезвом виде - 7
            Распаковка кортежа в отдельные свойства:
            Превышение скорости: 21, Вождение в нетрезвом виде: 7, Водители без прав: 12 */
    
    static func task5_4() {
        print("Задача 5.4: Создай второй кортеж - напарника. Задай другие значения.")
        
        let secondProtocol = (
            speeding: ("Превышение скорости", 27),
            drunk: ("Вождение в нетрезвом виде", 5),
            noLicense: ("Водители без прав", 21)
            )
        
        
    }
    static func task5_5() {
        print("Задача 5.5: Пусть напарники соревнуются: создай третий кортеж, который содержит разницу между первым и вторым. Выведи в консоль 3-мя способами.")
        
        let firstProtocol = (
            speeding: ("Превышение скорости", 21),
            drunk: ("Вождение в нетрезвом виде", 7),
            noLicense: ("Водители без прав", 12)
        )
        
        let secondProtocol = (
            speeding: ("Превышение скорости", 27),
            drunk: ("Вождение в нетрезвом виде", 5),
            noLicense: ("Водители без прав", 21)
            )
        
        
        let thirdProtocol = (
            (firstProtocol.drunk.1 - secondProtocol.drunk.1),
            (firstProtocol.speeding.1 - secondProtocol.speeding.1),
            (firstProtocol.noLicense.1 - secondProtocol.noLicense.1)
            )
        print("Разница по индексу: \(thirdProtocol.0), \(thirdProtocol.1), \(thirdProtocol.2).") // Разница: 2, -6, -9.
        print("Разница по имени:  Вождение в нетрезвом виде - \(thirdProtocol.0)")// Разница по имени:  Вождение в нетрезвом виде - 2
        let (drunk, speeding, noLiense) = thirdProtocol
        print(" Разница 'распаковка кортежа в отдельные свойства':  Водители без прав \(thirdProtocol.2) случаев.") //  Разница 'распаковка кортежа в отдельные свойства':  Водители без прав -9 случаев.
        
        let thirdProtocolPolice = (
            speeding: ("Превышение скорости", firstProtocol.speeding.1 - secondProtocol.speeding.1),
            drunk: ("Вождение в нетрезвом виде", firstProtocol.drunk.1 - secondProtocol.drunk.1),
            noLicense: ("Водители без прав", firstProtocol.noLicense.1 - secondProtocol.noLicense.1)
        )

        // Тогда вывод будет понятнее:
        print("Разница по speeding: \(thirdProtocolPolice.speeding.1)") // -6
        print("Разница по drunk: \(thirdProtocolPolice.drunk.1)")       // 2
        print("Разница по noLicense: \(thirdProtocolPolice.noLicense.1)") // -9
    }
    /* Разница по speeding: -6
     Разница по drunk: 2
     Разница по noLicense: -9 */
    
    
    // Tuples Practice: Advanced Level

static func task5a_1() {
    print("Задача 5a.1: Создай 12 кортежей-разработчиков, каждый с 4 параметрами: имя, возраст, опыт, специальность. Пока НЕ задавай никаких данных.")
    
    var developers = Array(repeating: (name: "", age: 0, exp: 0, spec: ""), count: 12)
    print("✅ Массив создан. Элементов: \(developers.count)")
    
    // Полная база данных программистов
    let legendaryProgrammers = [
        (name: "Craig Federighi", age: 56, exp: 30, spec: "iOS and macOS", company: "Apple"),
        (name: "Mike Rockwell", age: 55, exp: 25, spec: "Apple Vision Pro", company: "Apple"),
        (name: "Andreas Wendker", age: 52, exp: 28, spec: "Tools for Xcode, Swift", company: "Apple"),
        (name: "Kevin Lynch", age: 58, exp: 32, spec: "Apple Watch", company: "Apple"),
        (name: "Alan Dye", age: 49, exp: 20, spec: "UI Design iOS/macOS", company: "Apple"),
        (name: "Johny Srouji", age: 59, exp: 30, spec: "Apple Silicon", company: "Apple"),
        (name: "Steve Wozniak", age: 73, exp: 50, spec: "Apple Co-founder", company: "Apple"),
        (name: "Brendan Eich", age: 62, exp: 35, spec: "JavaScript", company: "Brave"),
        (name: "Guido van Rossum", age: 68, exp: 35, spec: "Python", company: "Microsoft"),
        (name: "Anders Hejlsberg", age: 63, exp: 40, spec: "Turbo Pascal, Delphi, C#", company: "Microsoft"),
        (name: "James Gosling", age: 69, exp: 40, spec: "Java", company: "Amazon"),
        (name: "Margaret Hamilton", age: 87, exp: 50, spec: "Apollo mission software", company: "NASA")
    ]
}
    static func task5a_2() {
        print("Задача 5a.2: После создания ВСЕМ задайте имя, 3 из них задайте возраст(любые значения выше 23), 4 - опыт и только 2 - специальность.")
        
        var developers = Array(repeating: (name: "", age: 0, exp: 0, spec: ""), count: 12)
        
        // 1. ВСЕМ задаем имена
        developers[0].name = "Craig Federighi"
        developers[1].name = "Mike Rockwell"
        developers[2].name = "Andreas Wendker"
        developers[3].name = "Kevin Lynch"
        developers[4].name = "Alan Dye"
        developers[5].name = "Johny Srouji"
        developers[6].name = "Steve Wozniak"
        developers[7].name = "Brendan Eich"
        developers[8].name = "Guido van Rossum"
        developers[9].name = "Anders Hejlsberg"
        developers[10].name = "James Gosling"
        developers[11].name = "Margaret Hamilton"
        
        // 2. 3 из них задаем возраст (>23)
        developers[0].age = 56  // Craig Federighi
        developers[1].age = 55  // Mike Rockwell
        developers[11].age = 87 // Margaret Hamilton
        
        // 3. 4 из них задаем опыт
        developers[2].exp = 28  // Andreas Wendker
        developers[8].exp = 35  // Guido van Rossum
        developers[9].exp = 35  // Anders Hejlsberg
        developers[10].exp = 40 // James Gosling
        
        // 4. только 2 из них задаем специальность (ПРАВИЛЬНЫЕ специальности)
        developers[0].spec = "iOS and macOS"           // Craig Federighi
        developers[11].spec = "Apollo mission software" // Margaret Hamilton
        
        print("✅ Данные заполнены по условию!")
    }
    
    static func task5a_3() {
        print("Задача 5a.3: Используя проверки if-else, выведи сообщение по логике: если возраст больше 23, есть опыт и специальность это iOS - в консоль выведи имя и сообщение - принят на работу.")
        
        let legendaryProgrammers = [
            (name: "Craig Federighi", age: 56, exp: 30, spec: "iOS and macOS", company: "Apple"),
            (name: "Mike Rockwell", age: 55, exp: 25, spec: "iOS and macOS", company: "Apple"),
            (name: "Andreas Wendker", age: 52, exp: 28, spec: "iOS and macOS", company: "Apple"),
            (name: "Kevin Lynch", age: 58, exp: 32, spec: "iOS and macOS", company: "Apple"),
            (name: "Alan Dye", age: 49, exp: 20, spec: "iOS and macOS", company: "Apple"),
            (name: "Johny Srouji", age: 59, exp: 30, spec: "iOS and macOS", company: "Apple"),
            (name: "Steve Wozniak", age: 73, exp: 50, spec: "iOS and macOS", company: "Apple"),
            (name: "Brendan Eich", age: 62, exp: 35, spec: "JavaScript", company: "Brave"),
            (name: "Guido van Rossum", age: 68, exp: 35, spec: "Python", company: "Microsoft"),
            (name: "Anders Hejlsberg", age: 63, exp: 40, spec: "Turbo Pascal, Delphi, C#", company: "Microsoft"),
            (name: "James Gosling", age: 69, exp: 40, spec: "Java", company: "Amazon"),
            (name: "Margaret Hamilton", age: 87, exp: 50, spec: "Apollo mission software", company: "NASA")
        ]
        
        for proger in legendaryProgrammers {
            if proger.age > 23 && proger.exp > 1 && proger.spec == "iOS and macOS" {
                print("\(proger.name) принят на работу в Apple Corporation.")
            } else {
                print("Кандидат не прошел собеседование")
            }
        }
    }
    /* Craig Federighi принят на работу в Apple Corporation.
     Mike Rockwell принят на работу в Apple Corporation.
     Andreas Wendker принят на работу в Apple Corporation.
     Kevin Lynch принят на работу в Apple Corporation.
     Alan Dye принят на работу в Apple Corporation.
     Johny Srouji принят на работу в Apple Corporation.
     Steve Wozniak принят на работу в Apple Corporation.
     Кандидат не прошел собеседование
     Кандидат не прошел собеседование
     Кандидат не прошел собеседование
     Кандидат не прошел собеседование
     Кандидат не прошел собеседование */
    
    static func task5a_4() {
        print("Задача 5a.4: Тех, кто младше 23, добавьте в массив и отсортируйте. Найдите в этом массиве max значение и удалите его.")
        
        let legendaryProgrammers = [
            (name: "Craig Federighi", age: 56, exp: 30, spec: "iOS and macOS", company: "Apple"),
            (name: "Mike Rockwell", age: 55, exp: 25, spec: "iOS and macOS", company: "Apple"),
            (name: "Andreas Wendker", age: 52, exp: 28, spec: "iOS and macOS", company: "Apple"),
            (name: "Kevin Lynch", age: 58, exp: 32, spec: "iOS and macOS", company: "Apple"),
            (name: "Alan Dye", age: 49, exp: 20, spec: "iOS and macOS", company: "Apple"),
            (name: "Johny Srouji", age: 59, exp: 30, spec: "iOS and macOS", company: "Apple"),
            (name: "Steve Wozniak", age: 73, exp: 50, spec: "iOS and macOS", company: "Apple"),
            (name: "Brendan Eich", age: 62, exp: 35, spec: "JavaScript", company: "Brave"),
            (name: "Guido van Rossum", age: 68, exp: 35, spec: "Python", company: "Microsoft"),
            (name: "Anders Hejlsberg", age: 63, exp: 40, spec: "Turbo Pascal, Delphi, C#", company: "Microsoft"),
            (name: "James Gosling", age: 69, exp: 40, spec: "Java", company: "Amazon"),
            (name: "Margaret Hamilton", age: 87, exp: 50, spec: "Apollo mission software", company: "NASA")
        ]
        
        var juniorProgers = legendaryProgrammers.filter { $0.age < 23 }
        
        // Проверяем, есть ли молодые программисты
        if juniorProgers.isEmpty {
            print("В массиве нет программистов младше 23 лет")
            return
        }
        
        juniorProgers.sort(by: { $0.age < $1.age })
        print("Отсортированный массив молодых программистов:")
        for proger in juniorProgers {
            print("\(proger.name), возраст: \(proger.age)")
        }
        
        // Находим максимальное значение (самого старшего среди молодых)
        if let maxAgeProger = juniorProgers.max(by: { $0.age < $1.age }) {
            print("\nMax значение: \(maxAgeProger.name), возраст: \(maxAgeProger.age)")
            
            if let index = juniorProgers.firstIndex(where: {
                $0.name == maxAgeProger.name && $0.age == maxAgeProger.age
            }) {
                juniorProgers.remove(at: index) // Исправлено: index вместо Index
                print("Удалили max значение")
            }
        }
        print("\nИтоговый массив после удаления:")
        
        if juniorProgers.isEmpty {
            print("Массив пуст")
        } else {
            for programmer in juniorProgers {
                print("\(programmer.name), возраст: \(programmer.age)")
            }
        }
    }
    /* Задача 5a.4: Тех, кто младше 23, добавьте в массив и отсортируйте. Найдите в этом массиве max значение и удалите его.
     В массиве нет программистов младше 23 лет */
    
    static func task5a_5() {
        print("Задача 5a.5: Создай массив и в проверку из п. 3 добавьте условие: если специальность не iOS - добавить в созданный массив.")
        
        let legendaryProgrammers = [
            (name: "Craig Federighi", age: 56, exp: 30, spec: "iOS and macOS", company: "Apple"),
            (name: "Mike Rockwell", age: 55, exp: 25, spec: "iOS and macOS", company: "Apple"),
            (name: "Andreas Wendker", age: 52, exp: 28, spec: "iOS and macOS", company: "Apple"),
            (name: "Kevin Lynch", age: 58, exp: 32, spec: "iOS and macOS", company: "Apple"),
            (name: "Alan Dye", age: 49, exp: 20, spec: "iOS and macOS", company: "Apple"),
            (name: "Johny Srouji", age: 59, exp: 30, spec: "iOS and macOS", company: "Apple"),
            (name: "Steve Wozniak", age: 73, exp: 50, spec: "iOS and macOS", company: "Apple"),
            (name: "Brendan Eich", age: 62, exp: 35, spec: "JavaScript", company: "Brave"),
            (name: "Guido van Rossum", age: 68, exp: 35, spec: "Python", company: "Microsoft"),
            (name: "Anders Hejlsberg", age: 63, exp: 40, spec: "Turbo Pascal, Delphi, C#", company: "Microsoft"),
            (name: "James Gosling", age: 69, exp: 40, spec: "Java", company: "Amazon"),
            (name: "Margaret Hamilton", age: 87, exp: 50, spec: "Apollo mission software", company: "NASA")
        ]
        
        // Создаем массив для не-iOS программистов
         var nonIOSProgrammers = [(name: String, age: Int, exp: Int, spec: String, company: String)]()
         
         for proger in legendaryProgrammers {
             if proger.age > 23 && proger.exp > 1 && !proger.spec.contains("iOS") {
                 // Добавляем в массив не-iOS программистов
                 nonIOSProgrammers.append(proger)
                 print("\(proger.name) добавлен в созданный массив.")
             } else {
                 print("Кандидат не прошел собеседование: \(proger.name)")
             }
         }
         
         // Выводим итоговый массив
         print("\nИтоговый массив не-iOS программистов:")
         if nonIOSProgrammers.isEmpty {
             print("Массив пуст")
         } else {
             for programmer in nonIOSProgrammers {
                 print("\(programmer.name) - \(programmer.spec) (\(programmer.company))")
             }
         }
     }
    /*  Итоговый массив не-iOS программистов:
     Brendan Eich - JavaScript (Brave)
     Guido van Rossum - Python (Microsoft)
     Anders Hejlsberg - Turbo Pascal, Delphi, C# (Microsoft)
     James Gosling - Java (Amazon)
     Margaret Hamilton - Apollo mission software (NASA) */
    
    // Альтернативный вариант с функциональным подходом:

    static func task5ab_5() {
        print("Задача 5ab.5: Создай массив и в проверку из п. 3 добавьте условие: если специальность не iOS - добавить в созданный массив.")
        
        let legendaryProgrammers = [
            (name: "Craig Federighi", age: 56, exp: 30, spec: "iOS and macOS", company: "Apple"),
            // ... остальной массив
        ]
        
        // Фильтруем и создаем массив за один шаг
        let nonIOSProgrammers = legendaryProgrammers.filter { proger in
            proger.age > 23 && proger.exp > 1 && !proger.spec.contains("iOS")
        }
        
        // Выводим результаты
        for proger in legendaryProgrammers {
            if proger.age > 23 && proger.exp > 1 && !proger.spec.contains("iOS") {
                print("\(proger.name) добавлен в созданный массив.")
            } else {
                print("Кандидат не прошел собеседование: \(proger.name)")
            }
        }
        
        // Выводим итоговый массив
        print("\nИтоговый массив не-iOS программистов:")
        if nonIOSProgrammers.isEmpty {
            print("Массив пуст")
        } else {
            for programmer in nonIOSProgrammers {
                print("\(programmer.name) - \(programmer.spec) (\(programmer.company))")
            }
        }
    }
    /* Итоговый массив не-iOS программистов:
     Brendan Eich - JavaScript (Brave)
     Guido van Rossum - Python (Microsoft)
     Anders Hejlsberg - Turbo Pascal, Delphi, C# (Microsoft)
     James Gosling - Java (Amazon)
     Margaret Hamilton - Apollo mission software (NASA) */
}
