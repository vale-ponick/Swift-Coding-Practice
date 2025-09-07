//
//  Strings.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 07.09.2025.

import Foundation

public struct Chapter2_Strings {
    public static func runAllTasks() {
        print("=== Глава 2: Строки ===")
        task2_1()
        task2_2()
        // Добавляйте новые задачи тут
    }
    
    static func task2_1() {
        print("Задача 2.1: Проверка палиндрома")
    }
    
    static func task2_2() {
        print("Задача 1.2: Реверс строки")
        let original = "Hello"
        let reversed = String(original.reversed())
        print("Оригинал: \(original), Реверс: \(reversed)")
    }
}

