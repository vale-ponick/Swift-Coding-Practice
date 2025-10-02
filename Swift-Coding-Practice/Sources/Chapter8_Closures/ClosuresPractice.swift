//
//  ClosuresPractice.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 01.10.2025.
//

import Foundation

public struct Chapter8_Closures {
    public static func runAllTasks() {
        print("=== Глава 8: Замыкания. ===")
        
        task8_1()
        task8_2()
        task8a_2()
        task8b_2()
        task8c_2()
        task8_3()
        task8_4()
        task8_5()
    }
    
    static func task8_1() {
        print("Задача 8.1: Написать, как понимаете замыкания, что это, для чего нужны?.")
        
        /*
         Замыкания 'Closures' в Swift - это:
         
         1. Самодостаточные блоки кода, которые м.б. переданы как аргументы
         2. Ключевое отличие от функций:
         Замыкания захватывают переменные из окружающей области видимости - мощный инструмент для callback'ов и асинхронных операций.
         3. Могут захватывать и хранить ссылки на свойства из окружающего контекста
         4. Альтернативный способ объявления функций, часто анонимных
         5. Имеют ТРИ основные формы:
         - Глобальные функции (именованные замыкания)
         - Вложенные функции (захватывают значения внешней функции)
         - Замыкающие выражения (анонимные, легковесные)
         
         Для чего нужны:
         - Обработка завершения асинхронных операций
         - Передача кастомного поведения в функции
         - Создание гибких и переиспользуемых компонентов
         - Функциональное программирование (map, filter, reduce)
         
         Синтаксис: { (parameters) -> ReturnType in
         statements } */
        
        // Примеры разных форм замыканий:
        
        // 1. Глобальная функция (именованное замыкание)
        func greeting(name: String) -> String {
            return "Hello, \(name)!"
        }
        print(greeting(name: "Vale-ponick!"))
        
        // 2. Замыкающее выражение
        let greetingClosure = { (name: String) -> String in
            return "Hello, \(name)!"
        }
        _ = "Vale-ponick"
        print(greetingClosure)
        
        // 3. Сокращенный синтаксис
        let shortGreet: (String) -> String = { "Hello, \($0)!" }
        print(shortGreet)
        
        // Использование с массивами
        let numbers = [1, 2, 3, 4, 5]
        let doubled = numbers.map { $0 * 2 } // [2, 4, 6, 8, 10]
        print(doubled)
    }
    
    static func task8_2() {
        print("Задача 8.2: Напиши 10 замыканий на примере сортировок массивов.")
        // базовые методы сортировки ЧИСЕЛ
        
        let nums = [7, 4, 1, 6, 2, 5, 3, 4, 5, 6, 7]
        
        let ascending = nums.sorted() // стандартная сортировка
        let descending = nums.sorted(by: >) // обратная сортировка
        
        let evenFirst = nums.sorted {a, b in // КАСТОМНАЯ логика
            (a % 2 == 0) && (b % 2 != 0)
        }
        
        // сортировка СТРОК
        
        let words = ["apple", "Banana", "herry", "date"]
        
        let alphabetical = words.sorted() // АЛФАВИТНЫЙ порядок
        
        let caseInsensitive = words.sorted() { // БЕЗ учета регистра
            $0.lowercased() < $1.lowercased()
        }
        print("\(caseInsensitive)")
        
        let byLength = words.sorted() { $0.count < $1.count } // по ДЛИНЕ строки
        print("\(byLength)")
        
        // 3. СОРТИРОВКА СТРУКТУР
        
        struct Person {
            let name: String
            let age: Int
            let city: String
        }
        
        let people = [
            Person(name: "Alice", age: 25, city: "New York"),
            Person(name: "Bob", age: 30, city: "Boston"),
            Person(name: "Charlie", age: 25, city: "Chicago")
        ]
        
        // ✅ По одному полю
        let byAge = people.sorted { $0.age < $1.age }
        print("\(byAge)")
        
        // ✅ По нескольким полям
        let complexSort = people.sorted { a, b in
            if a.city != b.city {
                return a.city < b.city
            } else if a.age != b.age {
                return a.age < b.age
            } else {
                return a.name < b.name
            }
        }
        print("\(complexSort)")
        
        // ✅ Сортировка с преобразованием
        let strings = ["5", "10", "1", "20"]
        let numericSort = strings.sorted {
            Int($0)! < Int($1)!
        } // ["1", "5", "10", "20"]
        print("\(numericSort)")
        
        // 5. Булевы значения
        
        let bools = [true, false, true, false, true]
        
        // ✅ True сначала
        let trueFirst = bools.sorted { a, b in
            a && !b
        } // [true, true, true, false, false]
        print("\(trueFirst)")
        
        // ✅ False сначала
        let falseFirst = bools.sorted { a, b in
            !a && b
        } // [false, false, true, true, true]
        print("\(falseFirst)")
        
        // 6. Сортировка по ключу
        
        // ✅ По вычисляемому свойству
        let dates = ["2023-01-15", "2022-12-01", "2023-03-20"]
        let chronological = dates.sorted {
            $0.compare($1, options: .numeric) == .orderedAscending
        }
        print("\(chronological)")
        
        // ✅ По расстоянию от точки
        let points = [1, 5, 10, 15]
        let target = 7
        let byDistance = points.sorted {
            abs($0 - target) < abs($1 - target)
        } // [5, 10, 1, 15]
        print("\(byDistance)")
    }
    /* Итог по видам сортировки:
     1. Простая - по одному критерию
     
     2. Множественная - несколько критериев по приоритету
     
     3. С преобразованием - вычисляемые значения
     
     4. Специальная - стабильная, по ключу, кастомная логика
     
     5. По типу данных - для каждого типа свои особенности  */

    static func task8a_2() {
        print("Зад...")
    }
    
    static func task8b_2() {
        print("Зад...")
    }
    
    static func task8c_2() {
        print("Зад...")
    }
    
    static func task8_3() {
        print("Задача 8.3: Напиши функцию, которая принимает массив, проверяет - пустой или нет. И если пустой - нужно написать туда значение.")
    }
    
    static func task8_4() {
        print("Задача 8.4: Напиши функцию - сайт, который требует имя, фамилию, ник, емейл, пароль. Все выведи в консоль.")
    }
    
    static func task8_5() {
        print("Задача 8.5: Напиши функции, которые принимают в качестве аргументов массивы и словари и проверяют: пустые или нет. Если пустые - добавляют туда значения и выводят в консоль.")
    }
}
