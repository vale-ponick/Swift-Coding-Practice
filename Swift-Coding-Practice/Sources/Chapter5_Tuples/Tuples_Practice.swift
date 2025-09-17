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
    print("Задача 5a.1: Создай 10 кортежей-разработчиков...")
}
    static func task5a_2() {
        print("Задача 5a.2: После создания всем задайте имя...")
    }
    static func task5a_3() {
        print("Задача 5a.3: Используя проверки if-else...")
    }
    static func task5a_4() {
        print("Задача 5a.4: Тех, кто младьше 21 года...")
    }
    static func task5a_5() {
        print("Задача 5a.5: Создай масив и в проверку из п. 3 добавьте ...")
    }
}
