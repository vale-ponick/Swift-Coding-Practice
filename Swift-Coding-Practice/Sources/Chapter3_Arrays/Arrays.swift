//
//  Arrays.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 07.09.2025.

import Foundation

public struct Chapter3_Arrays {
    public static func runAllTasks() {
        print("=== Глава 3: Массивы ===")
        task3_1()
        task3_2()
        task3_3()
        task3_4()
        task3_5()
        task3_6()
        // Arrays: Advanced Level
        task3a_1()
        task3ab_2()
        task3ac_1()
        task3a_2()
        task3aa_2()
        task3aaa_2()
        task3a_3()
        task3a_4()
        task3a_5()
        task3a_6()
        
        // Добавляйте новые задачи тут
    }
    
    static func task3_1() {
        print("Задача 3.1: ..")
    }
    
    static func task3_2() {
        print("Задача 3.2:...")
        let original = "Hello"
        let reversed = String(original.reversed())
        print("Оригинал: \(original), Реверс: \(reversed)")
    }
    
    static func task3_3() {
        print("Задача 3.3: ..")
    }
    static func task3_4() {
        print("Задача 3.4: ..")
    }
    static func task3_5() {
        print("Задача 3.5: Проверка палиндрома")
    }
    
    static func task3_6() {
        print("Задача 3.6: Создайте массив из чисел = купюр в долларах. Посчитай количество денег и выведи в консоль.")
        
        // Option 1: Loop
        let dollars = [100, 50, 2, 5, 5, 20, 10, 20, 50, 100, 1] // купюры
        var summaViaLoop: Int = 0
        for dollar in dollars {
            summaViaLoop += dollar
        }
        print("Cash in wallet from circle: \(summaViaLoop)") // Cash in wallet from circle: 363
        
        // Option 1: Reduce
        let summaViaReduce = dollars.reduce(0, +)
        print("Cash in wallet from 'reduce': \(summaViaReduce)") // Cash in wallet from 'reduce': 363
        
        // Verification
        print("Do the results match? \(summaViaReduce == summaViaLoop)") // Do the results match? true
    }
    
    // Arrays: Advanced Level
    
    static func task3a_1() {
        print("Задача 3a.1: Создай 10 строк с названиями стран. Создай массив.")
        // Option 1:
        let france = "France"
        let italy = "Italy"
        let germany = "Germany"
        let czechRepublic = "Czech Republic"
        let denmark = "Denmark"
        let croatia = "Croatia"
        let ireland = "Ireland"
        let austria = "Austria"
        let sweden = "Sweden"
        let poland = "Poland"
        
        var euCountries: [String] = []
        
        euCountries.append(france)
        euCountries.append(contentsOf: [italy, germany, czechRepublic])
        euCountries.append(contentsOf: [denmark, croatia, ireland, austria, sweden, poland])
        
        print(euCountries) // ["France", "Italy", "Germany", "Czech Republic", "Denmark", "Croatia", "Ireland", "Austria", "Sweden", "Poland"]
        
        // Option 2:
        let europeanUnion = [
            "France",
            "Italy",
            "Germany",
            "Czech Republic",
            "Denmark",
            "Croatia",
            "Ireland",
            "Austria",
            "Sweden",
            "Poland"
        ]
        print(europeanUnion) // ["France", "Italy", "Germany", "Czech Republic", "Denmark", "Croatia", "Ireland", "Austria", "Sweden", "Poland"]
    }
    
    static func task3ab_2() {
        print("Задача 3a.1: Проверь строки, если в строке > 5 символов - добавь ее в массив. Но если строка содержит букву А, замени эту букву на другую и добавь измененную строку с массив.")
        
        var resultArray: [String] = []
        
        // option 1: Loop with replacement logic
        
        let europeanUnion = [
            "France",
            "Italy",
            "Germany",
            "Czech Republic",
            "Denmark",
            "Croatia",
            "Ireland",
            "Austria",
            "Sweden",
            "Poland"
        ]
        for country in europeanUnion {
            if country.count > 6 {
                if country.contains("A") || country.contains("a") {
                    let modifiedCountry = country.replacingOccurrences(of: "a", with: "Y", options: .caseInsensitive)
                    resultArray.append(modifiedCountry)
                } else {
                    resultArray.append(country)
                }
            }
        }
        print("Option 1 result: \(resultArray)") // Option 1 result: ["GermYny", "Czech Republic", "DenmYrk", "CroYtiY", "IrelYnd", "YustriY"]
        
        // Option 2: Functional style
        
        let resArray = europeanUnion.filter { $0.count > 6 }.map { country in
            if country.contains("a") || country.contains("A") {
                return country.replacingOccurrences(of: "a", with: "Y", options: .caseInsensitive)
            } else {
                return country
            }
        }
        print("Option 2 result: \(resArray)") // Option 2 result: ["GermYny", "Czech Republic", "DenmYrk", "CroYtiY", "IrelYnd", "YustriY"]
        
        // COMMENTS:
        /*  Что делает код:
         
         1. filter { $0.count > 6 } - отбирает страны длиннее 6 символов
         2. map { ... } - преобразует каждую страну по правилу:
         
         Если есть 'A' или 'a' → заменяет на 'Y'
         Если нет → оставляет как есть  */
        
        // Option 3
        let modifyArray = europeanUnion
            .filter { $0.count > 6 }
            .map { $0.replacingOccurrences(of: "a", with: "Y", options: .caseInsensitive) }
        print(modifyArray) // ["GermYny", "Czech Republic", "DenmYrk", "CroYtiY", "IrelYnd", "YustriY"]
        
    }
    static func task3ac_1() {
        print("Задача 3a.3: Найти все страны, которые заканчиваются на букву 'y' и перевести их в верхний регистр")
        
        // option 1: 🐢 'Imperative style'
        
        let euroUnion = [
            "France",
            "Czech Republic",
            "Italy",
            "Denmark",
            "Croatia",
            "Ireland",
            "Austria",
            "Sweden",
            "Poland"
        ]
        
        var upperResult: [String] = []
        for country in euroUnion {
            if country.hasSuffix("y") {
                upperResult.append(country.uppercased())
            }
        }
        print(upperResult) // ["ITALY"]
        
        // option 2: 🦅 'Functional style'
        let upperRes = euroUnion
            .filter { $0.last == "y" }
            .map { $0.uppercased() }
        
        print(upperRes) // ["ITALY"]
        
        // ⚡ Декларативный стиль (экспертный уровень)
        
        // Твоя реализация здесь (максимум 1 строка цепочки!)
        let result = euroUnion
            .filter { $0.last == "y" }
            .map { $0.uppercased() }
        print(result) // ["ITALY"]
        
        //
        let res = euroUnion
            .compactMap { $0.hasSuffix("y") ? $0.uppercased() : nil }
        print(res) // ["ITALY"]
        
        // COMMENTS:
        /*  💡 Почему compactMap более декларативный:
         
         1) Одна операция вместо двух (filter + map)
         2) Более выразительно - "преобразуй если условие, иначе пропусти"
         3) Лучшая производительность - один проход по массиву  */
    }
    
    static func task3a_2() {
        print("Задача 3a.2: Создайте масив из 6 значений любого типа. Сделайте линейную сортировку - 'Selection Sort'.")
            
            // option 1: 🐢 'Imperative style'
            var nums = [90, 21, 1, 888, 12, 45] // Создай массив
            print("Исходный массив: \(nums)")
            
            let countNums = nums.count
            
            // 2. Внешний цикл
            for i in 0..<countNums - 1 {
                var minIndex = i // Предполагаем: min элемент - первый в неотсортированной части
                
                // 3. Внутренний цикл (ЛИНЕЙНЫЙ ПРОХОД для поиска минимума)
                for j in i + 1..<countNums {
                    if nums[j] < nums[minIndex] {
                        minIndex = j // Обновляем индекс минимального элемента
                    }
                }
                
                // 5. После того как нашли min в НЕотсортированной части, меняем его местами с элементом на позиции i
                if minIndex != i {
                    nums.swapAt(i, minIndex) // Более Swift-способ обмена элементов
                }
            }
            
            // 6. Вывод результата (вынесен за пределы цикла)
            print("Отсортированный массив: \(nums)") // Отсортированный массив: [1, 12, 21, 45, 90, 888]
        }
    
    /*  Объяснение алгоритма:
     
     - Внешний цикл (for i in 0..<countNums - 1) проходит по всем элементам массива, кроме последнего
     - Внутренний цикл (for j in i+1..<countNums) ищет min элемент в неотсортированной части массива
     - Обмен элементов - меняем местами текущий элемент с найденным min */
    
   // Альтернативный вариант с выводом промежуточных шагов:

    static func task3aa_2() {
        print("Задача 3aa.2: Создайте массив из 6 значений любого типа. Сделайте линейную сортировку (linear sort).")
        
        var nums = [90, 21, 1, 888, 12, 45]
        print("Исходный массив: \(nums)")
        
        let countNums = nums.count
        
        for i in 0..<countNums - 1 {
            var minIndex = i
            
            for j in i + 1..<countNums {
                if nums[j] < nums[minIndex] {
                    minIndex = j
                }
            }
            
            if minIndex != i {
                nums.swapAt(i, minIndex)
                print("Шаг \(i + 1): Поменяли \(nums[minIndex]) и \(nums[i]) → \(nums)")   // Вот откуда появляются эти принты!
            }
        }
        
        print("Финальный отсортированный массив: \(nums)")
    }
    /*  Откуда взялись эти принты:

     print("Шаг \(i + 1): Поменяли \(oldValueAtI) и \(oldValueAtMinIndex) → \(nums)") - эта строка внутри условия if minIndex != i выводит информацию о каждом обмене элементов
     Как это работает на каждом шаге:
     
     Исходный массив: [90, 21, 1, 888, 12, 45]
     
     Шаг 1: Находим минимальный элемент (1) и меняем его с первым элементом (90)
     Шаг 2: В оставшейся части находим минимальный (12) и меняем со вторым элементом (21)
     Шаг 3: Находим минимальный (21) в оставшейся части и меняем с третьим элементом (90)
     Шаг 4: Находим минимальный (45) и меняем с четвертым элементом (888) */
    
    // Альтернативный вариант с другими типами данных:

    static func task3aaa_2() {
        print("Задача 3a.2: Создайте массив из 6 значений любого типа. Сделайте линейную сортировку")
        
        // Массив строк
        var strings = ["banana", "apple", "cherry", "limon", "kiwi", "fig"]
        print("Исходный массив строк: \(strings)") // 🥝 → 🍎 → 🍈 → 🍌 → 🍋 → 🍒 Исходный массив строк: ["banana", "apple", "cherry", "limon", "kiwi", "fig"]
        
        let count = strings.count
        
        for i in 0..<count - 1 {
            var minIndex = i
            for j in i+1..<count {
                if strings[j] < strings[minIndex] {
                    minIndex = j
                }
            }
            if minIndex != i {
                strings.swapAt(i, minIndex) // Более Swift-способ обмена элементов
            }
        }
        
        print("Отсортированный массив строк: \(strings)") // Отсортированный массив строк: 🍎🍌🍒🍈🥝🍋 ["apple", "banana", "cherry", "fig", "kiwi", "limon"]
    }
    
    static func task3a_3() {
        print("Задача 3a.2: Создайте масив из 6 значений любого типа. Сделайте линейную сортировку (linear sort.")
        
    }
    static func task3a_4() {
        print("Задача 3a.2: Создайте масив из 6 значений любого типа. Сделайте линейную сортировку (linear sort.")
        
    }
    static func task3a_5() {
        print("Задача 3a.2: Создайте масив из 6 значений любого типа. Сделайте линейную сортировку (linear sort.")
        
    }
    static func task3a_6() {
        print("Задача 3a.2: Создайте масив из 6 значений любого типа. Сделайте линейную сортировку (linear sort.")
        
    }
}


