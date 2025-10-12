//
//  ClosuresAdvancedLevel.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 04.10.2025.
//

import Foundation

public struct Chapter8_ClosuresAdvancedLevel {  // ← измени здесь имя
    public static func runAllTasks() {
        print("=== Глава 8: Замыкания. ===")
        
        task8a_1()
        task8a_2()
        task8a_3()
        task8a_4()
        task8a_5()
    }
    
    static func task8a_1() {
        print("Задача 8a.1:  Создай функцию, которая принимает массив Double. Напиши алгоритм, который находит в массиве min значение. Распечатай результат на консоль.")
        
        func findMin(nums: [Double]) -> Double {
            nums.min() ?? 0
        }
        print(findMin(nums: [3.14, 2.22, 0.01, 12.12, 21.21])) // 0.01
    }
    
    static func task8a_2() {
        print("Задача 8a.2: Теперь в этом же массиве найди max значение. Распечатай результат в консоль.")
        
        //MARK: оператор nil-coalescing (оператор объединения по nil)
        func findMax(nums: [Double]) -> Double {
            nums.max() ?? 0
        }
        print(findMax(nums: [3.14, 2.22, 0.01, 12.12, 21.21])) // 21.21
    }
    static func task8a_3() {
        print("Задача 8a.3: Создай функцию, которая принимает массив букв (Chars). Отсортируй массив так, чтобы гласные оказались в левой части, а согласные - в правой. Раздели массив на гласные и согласные (два отдельных массива). Отсортируй каждый по алфавиту. Распечатай результат в консоль.")
        
        func get(letters: [Character]) {
            let vowels = "aeiou" // строка - коллекция символов
            // 1. Разделяем на гласные и согласные
            let vowelsArray = letters.filter { vowels.contains($0) }
            let consonantArray = letters.filter {
                $0.isLetter && !vowels.contains($0)
            }
            
            // 2. Сортируем каждый массив по алфавиту
            let sortedVowels = vowelsArray.sorted()
            let sortedConsonants = consonantArray.sorted()
            
            // 3. Объединяем (гласные слева, согласные справа)
            let result = sortedVowels + sortedConsonants
            
            // 4. Выводим в консоль
            print("Исходный массив: \(letters)") // Исходный массив: ["a", "b", "c", "2", "f", "w", "q", "i", "o", "u", "z", "$"]
            print("Гласные: \(sortedVowels)") // Гласные: ["a", "i", "o", "u"]
            print("Согласные: \(sortedConsonants)") // Согласные: ["b", "c", "f", "q", "w", "z"]
            print("Финальный результат: \(result)") // Финальный результат: ["a", "i", "o", "u", "b", "c", "f", "q", "w", "z"]
        }
        get(letters: ["a", "b", "c", "2", "f", "w", "q", "i", "o", "u", "z", "$"])
    }
    
    static func task8a_4() {
        print("Задача 8a.4: Сложи полученные массивы в один. Распечатай результат в консоль.")
    }
    static func task8a_5() {
        print("Задача 8a.5: ....")
    }
}
