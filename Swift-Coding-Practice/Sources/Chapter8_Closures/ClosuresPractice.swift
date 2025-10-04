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
        print("Задача 8a.2: Напиши 10 замыканий на примере сортировок массивов: Простая - по одному критерию.")
        
        let cities = ["london", "Paris", "rome", "Berlin", "vashington", "Mexico"]
        let nums = [888, 9, 12, 21, 555, 33, 4, 77]
        let names = ["Anna", "john", "Maria", "alex", "Zoe", "Brian"]
        
        // 1. Сортировка городов по длине строки (ваш пример)
        let byLengthSorted = cities.sorted { $0.count < $1.count }
        print("1. По длине: \(byLengthSorted)")
        
        // 2. Сортировка чисел по убыванию (ваш пример)
        let numsDescending = nums.sorted { $0 > $1 }
        print("2. Числа по убыванию: \(numsDescending)")
        
        // 3. Сортировка городов без учета регистра по возрастанию
        let citiesAlphabetical = cities.sorted { $0.lowercased() < $1.lowercased() }
        print("3. Города по алфавиту: \(citiesAlphabetical)")
        
        // 4. Сортировка по последнему символу
        let byLastChar = cities.sorted {
            let last1 = $0.last ?? Character("")
            let last2 = $1.last ?? Character("")
            return last1 < last2
        }
        print("4. По последнему символу: \(byLastChar)")
        
        // 5. Сортировка по количеству гласных букв
        let byVowelCount = cities.sorted {
            let vowels1 = $0.lowercased().filter { "aeiou".contains($0) }.count
            let vowels2 = $1.lowercased().filter { "aeiou".contains($0) }.count
            return vowels1 > vowels2
        }
        print("5. По кол-ву гласных: \(byVowelCount)")
        
        // 6. Сортировка по наличию определенной буквы
        let byContainsE = cities.sorted {
            let hasE1 = $0.lowercased().contains("e")
            let hasE2 = $1.lowercased().contains("e")
            return hasE1 && !hasE2 // Сначала те, что содержат 'e'
        }
        print("6. По наличию 'e': \(byContainsE)")
        
        // 7. Сортировка чисел по четности (сначала четные)
        let byEvenFirst = nums.sorted {
            let isEven1 = $0 % 2 == 0
            let isEven2 = $1 % 2 == 0
            return isEven1 && !isEven2
        }
        print("7. Четные первые: \(byEvenFirst)")
        
        // 8. Сортировка имен с учетом регистра (Z перед a)
        let caseSensitive = names.sorted { $0 < $1 }
        print("8. С учетом регистра: \(caseSensitive)")
        
        // 9. Сортировка по разнице между числом и 50
        let byDistanceFrom50 = nums.sorted {
            abs($0 - 50) < abs($1 - 50)
        }
        print("9. Ближайшие к 50: \(byDistanceFrom50)")
        
        // 10. Сортировка по возрастанию суммы цифр числа
        let byDigitSum = nums.sorted {
            let sum1 = String($0).compactMap { $0.wholeNumberValue }.reduce(0, +)
            let sum2 = String($1).compactMap { $0.wholeNumberValue }.reduce(0, +)
            return sum1 < sum2
        }
        print("10. По сумме цифр: \(byDigitSum)")
    }
    /* Задача 8a.2: Напиши 10 замыканий на примере сортировок массивов: Простая - по одному критерию.
     1. По длине: ["rome", "Paris", "london", "Berlin", "Mexico", "vashington"]
     2. Числа по убыванию: [888, 555, 77, 33, 21, 12, 9, 4]
     3. Города по алфавиту: ["Berlin", "london", "Mexico", "Paris", "rome", "vashington"]
     4. По последнему символу: ["rome", "london", "Berlin", "vashington", "Mexico", "Paris"]
     5. По кол-ву гласных: ["vashington", "Mexico", "london", "Paris", "rome", "Berlin"]
     6. По наличию 'e': ["rome", "Berlin", "Mexico", "london", "Paris", "vashington"]
     7. Четные первые: [888, 12, 4, 9, 21, 555, 33, 77]
     8. С учетом регистра: ["Anna", "Brian", "Maria", "Zoe", "alex", "john"]
     9. Ближайшие к 50: [33, 77, 21, 12, 9, 4, 555, 888]
     10. По сумме цифр: [12, 21, 4, 33, 9, 77, 555, 888] */
    
    static func task8b_2() {
        print("Задача 8a.2: Напиши 10 замыканий на примере сортировок массивов: Простая - по одному критерию.")
        // ПРОСТАЯ сортировка - String
        
        let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        
        let byLengthSorted = daysOfWeek.sorted { $0.count < $1.count }
        print("1. Сортировка массива строк по длине: \(byLengthSorted)")
        // 1. Сортировка массива строк по длине: ["Sunday", "Monday", "Friday", "Tuesday", "Thursday", "Saturday", "Wednesday"]
        
        let byAlphabetical = daysOfWeek.sorted()
        print("2. Сортировка массива строк по алфавиту: \(byAlphabetical)") // 2. Сортировка массива строк по алфавиту: ["Friday", "Monday", "Saturday", "Sunday", "Thursday", "Tuesday", "Wednesday"]
        
        let byFirstChar = daysOfWeek.sorted {
            let first1 = $0.first ?? Character("") //
            let first2 = $1.first ?? Character("")
            return first1 > first2
        }
        print("3. Сортировка массива строк по первому символу: \(byFirstChar)") // 3. Сортировка массива строк по первому символу: ["Wednesday", "Tuesday", "Thursday", "Sunday", "Saturday", "Monday", "Friday"]
        
        let byLastChar = daysOfWeek.sorted {
            let last1 = $0.last ?? Character("") //
            let last2 = $1.last ?? Character("")
            return last1 > last2
        }
        print("4. Сортировка массива строк по последнему символу: \(byLastChar)") // 3. Сортировка массива строк по последнему символу: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        
        let byVowelsCount = daysOfWeek.sorted {
            let vowels1 = $0.lowercased().filter {
                "aeoiu".contains($0) }.count
            let vowels2 = $1.lowercased().filter {
                "aeoiu".contains($0) }.count
            return vowels1 > vowels2
        }
        print("5. Сортировка массива строк по количеству гласных: \(byVowelsCount)") // 5. Сортировка массива строк по количеству гласных: ["Tuesday", "Wednesday", "Saturday", "Sunday", "Monday", "Thursday", "Friday"]
        
        let byLetter = daysOfWeek.sorted {
            let hasI1 = $0.lowercased().contains("i")
            let hasI2 = $1.lowercased().contains("i")
            return hasI1 && !hasI2
        }
        print("6. Сортировка массива строк по определенной букве - 'i' - \(byLetter)") // 6. Сортировка массива строк по определенной букве - 'i' - ["Friday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Saturday"]
        
        let names = ["Joe", "ann", "Andy", "Boris", "bill", "Dennis", "denny"]
        
        let byRegister = names.sorted { $0 < $1 }
        print("7. Сортировка массива строк с учетом регистра: \(byRegister)") // 7. Сортировка массива строк с учетом регистра: ["Andy", "Boris", "Dennis", "Joe", "ann", "bill", "denny"]
        
        let nums = [888, 12, 3, 45, 21, 777, 100, 99, 201]
        let byIncreasing = nums.sorted { $0 < $1 }
        print("8. Сортировка массива чисел по возрастанию: \(byIncreasing)") // 8. Сортировка массива чисел по возрастанию: [3, 12, 21, 45, 99, 100, 201, 777, 888]
    
    let byDecreasing = nums.sorted { $0 > $1 }
    print("9. Сортировка массива чисел по убыванию: \(byDecreasing)") // 9. Сортировка массива чисел по убыванию: [888, 777, 201, 100, 99, 45, 21, 12, 3]
        
        let byEvenFirst = nums.sorted {
            let num1 = $0 % 2 == 0
            let num2 = $1 % 2 == 0
            return num1 && !num2
        }
        print("10. Сортировка массива чисел: четные - вперед! \(byEvenFirst)") // 10. Сортировка массива чисел: четные - вперед! [888, 12, 100, 3, 45, 21, 777, 99, 201]
        
        let byOddFirst = nums.sorted {
            let num1 = $0 % 2 != 0
            let num2 = $1 % 2 != 0
            return num1 && !num2
        }
        print("11. Сортировка массива чисел: НЕчетные - вперед! \(byOddFirst)") // 11. Сортировка массива чисел: НЕчетные - вперед! [3, 45, 21, 777, 99, 201, 888, 12, 100]
        
        let byDistanseFrom100 = nums.sorted {
            abs($0 - 100) < abs($1 - 100)
        }
        print("Сортировка массива чисел 'ближайшее к 100' \(byDistanseFrom100)") // Сортировка массива чисел 'ближайшее к 100' [100, 99, 45, 21, 12, 3, 201, 777, 888]
        
        let byDigitSum = nums.sorted {
            let sum1 = String($0).compactMap { $0.wholeNumberValue }.reduce(0, +)
            let sum2 = String($1).compactMap { $0.wholeNumberValue }.reduce(0, +)
            return sum1 < sum2
        }
        print("Сортировка массива чисел по суме цифр: \(byDigitSum)") // Сортировка массива чисел по суме цифр: [100, 12, 3, 21, 201, 45, 99, 777, 888]
        
        // 3. Упрощенная сортировка по первому символу
        let byFirstCharacter = daysOfWeek.sorted { $0.first! > $1.first! }
        print("\(byFirstCharacter)")
        // Или даже так (сравнение строк по первому символу):
        let byFirstChars = daysOfWeek.sorted { String($0.prefix(1)) > String($1.prefix(1)) }
        print("\(byFirstChars)")

        // 4. Упрощенная сортировка по последнему символу
        let byLastCharacter = daysOfWeek.sorted { $0.last! > $1.last! }
        print("\(byLastCharacter)")

        // 6. Упрощенная сортировка по наличию буквы 'i'
        let byLetterI = daysOfWeek.sorted { $0.lowercased().contains("i") && !$1.lowercased().contains("i") }
        print("\(byLetterI)")
}
  
    static func task8c_2() {
        print("Задача 8с.2 Напиши три замыкания на примере сортировки массива структур (сложные объекты.")
        
        struct User {
            let name: String
            let nick: String
            let age: Int
            let email: String
        }
        let users = [
            User(name: "Ann", nick: "@nn", age: 15, email: "ann15@gmail.com"),
            User(name: "Joe", nick: "J0e21", age: 21, email: "joe21@gmail.com"),
            User(name: "Sam", nick: "$@m27", age: 27, email: "sam27@gmail.com"),
            User(name: "Kate", nick: "k@t3", age: 19, email: "kate19@gmail.com"),
            User(name: "Mike", nick: "m1k3", age: 25, email: "mike25@gmail.com")
        ]
        
        let byName = users.sorted { $0.name < $1.name }
        print("1. По имени (A - Z): ")
        byName.forEach { print(" - \($0.name), \($0.age), \($0.nick), \($0.email)") }
        /* 1. По имени (A - Z):
         - Ann, 15, @nn, ann15@gmail.com
         - Joe, 21, J0e21, joe21@gmail.com
         - Kate, 19, k@t3, kate19@gmail.com
         - Mike, 25, m1k3, mike25@gmail.com
         - Sam, 27, $@m27, sam27@gmail.com */
        
        let byAgeDescending = users.sorted { $0.age > $1.age }
        print("2. По возрасту(убывание) ")
        byAgeDescending.forEach { print(" \($0.name), \($0.age)") }
        /* 2. По возрасту(убывание)
                Sam, 27
                Mike, 25
                Joe, 21
                Kate, 19
                Ann, 15 */
        
        let byNickLength = users.sorted { $0.nick.count > $1.nick.count }
        print("n3. По длине никнейма ")
        byNickLength.forEach { print(" - \($0.nick), \($0.name), \($0.nick.count)") }
        /* 3. По длине никнейма
                - J0e21, Joe, 5
                - $@m27, Sam, 5
                - k@t3, Kate, 4
                - m1k3, Mike, 4
                - @nn, Ann, 3 */
        
        let bySpecialCharsInNick = users.sorted { user1, user2 in
            let specialChars = CharacterSet(charactersIn: "@$#!&*")
            let count1 = user1.nick.unicodeScalars.filter { specialChars.contains($0) }.count
            let count2 = user2.nick.unicodeScalars.filter { specialChars.contains($0) }.count
            return count1 < count2
        }
        print("\n4. По количеству специальных символов в нике:")
         bySpecialCharsInNick.forEach { print("   - \($0.nick) (\($0.name))") }
        /* 4. По количеству специальных символов в нике:
                - J0e21 (Joe)
                - m1k3 (Mike)
                - @nn (Ann)
                - k@t3 (Kate)
                - $@m27 (Sam)*/
        
        // 5. Комбинированная сортировка: сначала по возрасту, затем по имени
            let byAgeThenName = users.sorted {
                if $0.age != $1.age {
                    return $0.age < $1.age
                } else {
                    return $0.name < $1.name
                }
            }
            print("\n5. Комбинированная: по возрасту, затем по имени:")
            byAgeThenName.forEach { print("   - \($0.name), возраст: \($0.age)") }
        /* 5. Комбинированная: по возрасту, затем по имени:
         - Ann, возраст: 15
         - Kate, возраст: 19
         - Joe, возраст: 21
         - Mike, возраст: 25
         - Sam, возраст: 27 */
        }
    
    
    static func task8_3() {
        print("Задача 8.3: Напиши функцию, которая принимает массив, проверяет - пустой или нет. И если пустой - нужно написать туда значение.")
        
        // var. 1 С inout (изменяет исходный массив)
        func check(text: inout [String]) {
            
            if text.isEmpty {
                text.append("Hi")
            }
        }
        
        // var. 2
        func change(text: [String]) -> [String] {
            var result = text
            if result.isEmpty {
                result.append("Hi, Vale!")
            }
            return result
        }
        // Тестирование
         var testArray: [String] = []
         check(text: &testArray)
         print(testArray) // ["Hi"]
         
         print(change(text: [])) // ["Hi, Vale!"]
        
        // вар. 3 коротко + тернарный оператор
        
        func check(text: [String]) -> [String] {
            text.isEmpty ? ["Hi"] : text
        }
        
        // вар. 4 используя nil-coalescing
        
        func check(text1: [String]) -> [String] {
            text1.isEmpty ? ["Hi"] : text1
        }
    }
    
    static func task8_4() {
        print("Задача 8.4: Напиши функцию - сайт, который требует имя, фамилию, ник, емейл, пароль. Все выведи в консоль.")
        
        struct User {
            let name: String
            let surname: String
            let nick: String
            let email: String
            let password: String
        }
            
            let users = [
                User(name: "Sammium", surname: "Scromby", nick: "Sam", email: "$am@gmail.com", password: "hobbit"),
                User(name: "Merriadok", surname: "Brendyzike", nick: "Merry", email: "m@rry@gmail.com", password: "shire"),
                User(name: "Peregrin", surname: "Took", nick: "Pin", email: "p!n@gmail.com", password: "greenDragon")
            ]
        func site(users:[User]) {
            for user in users {
                print("Имя: \(user.name), Фамилия: \(user.surname), Никнейм: \(user.nick), Почта: \(user.email), Пароль: \(user.password)")
            }
        }
        site(users: users)
        /* Имя: Sammium, Фамилия: Scromby, Никнейм: Sam, Почта: $am@gmail.com, Пароль: hobbit
         Имя: Merriadok, Фамилия: Brendyzike, Никнейм: Merry, Почта: m@rry@gmail.com, Пароль: shire
         Имя: Peregrin, Фамилия: Took, Никнейм: Pin, Почта: p!n@gmail.com, Пароль: greenDragon */
    }
    
    static func task8_5() {
        print("Задача 8.5: Напиши функции, которые принимают в качестве аргументов массивы и словари и проверяют: пустые или нет. Если пустые - добавляют туда значения и выводят в консоль.")
        
        // var. 1 коротко + тернарный оператор
        func check(nums: [Int]) -> [Int] {
            nums.isEmpty ? [12,21] : nums
        }
        print(check(nums: [])) // [12, 21]
        
        func check(name: [String: Int]) -> [String: Int] {
            name.isEmpty ? ["Joe": 21] : name
        }
        print(check(name: [:])) // ["Joe": 21]
        
        // var.2 используя nil-coalescing
        func check(seasons: [String]?) -> [String] {
            seasons ?? ["Winter"]
        }
        print(check(seasons: [])) // []
        print(check(seasons: nil)) // ["Winter"]
              
        func check(daysOfWeek: [String: Int]?) -> [String: Int] {
            daysOfWeek ?? ["Sunday": 1]
        }
        print(check(daysOfWeek: [:])) // [:]
        print(check(daysOfWeek: nil )) // ["Sunday": 1]
        
    }
}

