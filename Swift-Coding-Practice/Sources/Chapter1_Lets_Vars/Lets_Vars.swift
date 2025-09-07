//
//  Lets_Vars.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 07.09.2025.

import Foundation

public struct Chapter1_Lets_Vars {
    public static func runAllTasks() {
        print("=== Глава 1: Строки ===")
        task1_1()
        task1_2()
        // Добавляйте новые задачи тут
    }
    
    static func task1_1() {
        print("Задача 1.1: Проверка палиндрома")
    }
    
    static func task1_2() {
        print("Задача 1.2: Реверс строки")
        let original = "Hello"
        let reversed = String(original.reversed())
        print("Оригинал: \(original), Реверс: \(reversed)")
    }
}

