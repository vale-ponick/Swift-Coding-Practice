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
        
        func findMin(arr: [Double]) -> Double {
            arr.min() ?? 0
        }
        print(findMin(arr: [3.14, 2.22, 0.01, 12.12, 21.21])) // 0.01
    }
    
    static func task8a_2() {
        print("Задача 8a.2: Теперь в этом же массиве найди max значение. Распечатай результат в консоль.")
        
        func findMax(arr: [Double]) -> Double {
            arr.max() ?? 0
        }
        print(findMax(arr: [3.14, 2.22, 0.01, 12.12, 21.21])) // 21.21
    }
    static func task8a_3() {
        print("Задача 8a.3: Создай функцию, которая принимает массив букв (Chars). Отсортируй массив так, чтобы гласные оказались в левой части, а согласные - в правой. Раздели массив на гласные и согласные (два отдельных массива). Отсортируй каждый по алфавиту. Распечатай результат в консоль.")
        
        func get(letters: [Character]) {
            
        }
        
    }
    static func task8a_4() {
        print("Задача 8a.4: Сложи полученные массивы в один. Распечатай результат в консоль.")
    }
    static func task8a_5() {
        print("Задача 8a.5: ....")
    }
}
