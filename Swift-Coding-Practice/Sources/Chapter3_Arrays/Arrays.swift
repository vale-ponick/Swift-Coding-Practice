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
        // Добавляйте новые задачи тут
    }
    
    static func task3_1() {
        print("Задача 3.1: Проверка палиндрома")
    }
    
    static func task3_2() {
        print("Задача 3.2: Реверс строки")
        let original = "Hello"
        let reversed = String(original.reversed())
        print("Оригинал: \(original), Реверс: \(reversed)")
    }
    
    static func task3_3() {
        print("Задача 3.3: Проверка палиндрома")
    }
    static func task3_4() {
        print("Задача 3.4: Проверка палиндрома")
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
}
