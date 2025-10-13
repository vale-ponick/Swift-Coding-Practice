//
//  enumsPractice.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 13.10.2025.
//

import Foundation

public struct Chapter9_Enumerations {
    public static func runAllTasks() {
        print("=== Глава 9: Перечисления ===")
        
        task9_1()
        task9_2()
        task9_2a()
        task9_2b()
        task9_2c()
        task9_2d()
        task9_2e()
        task9_2f()
        task9_2g()
        task9_3()
        task9_4()
    }
    
    static func task9_1() {
        print("Задача 9.1: Напиши, как понимаешь перечисления: что это такое, в чем их смысл, зачем нужны? Как и где их можно использовать?")
    }
    static func task9_2() {
        print("Задача 9.2: Напиши 5-10 enum разных типов + создай как можно больше своих enums. Главное: соблюдай правила написания - понятность + ЗАглавная буква в начале названия. Пропусти через switch и распечатай.")
    }
    
static func task9_2a() {
    print("Задача 9.2.a: Создай enum для дней недели и функцию, которая определяет, является ли день выходным?")

    enum Weekday {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
    }
    func isWeekend(day: Weekday) -> Bool {
        switch day {
        case .saturday, .sunday:
            return true
        default:
            return false
        }
    }
    // протестируем дни недели
    let days: [Weekday] = [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday, .sunday]

    for day in days {
        print("\(day) - выходной: \(isWeekend(day: day))")
    }
    /*  monday - выходной: false
        tuesday - выходной: false
        wednesday - выходной: false
        thursday - выходной: false
        friday - выходной: false
        saturday - выходной: true
        sunday - выходной: true    */
}
    
    static func task9_2b() {
        print("Задача 9.2.b: Создай enum для основных цветов и функцию, которая возвращает HEX-код для каждого цвета")
        enum Color {
            case red
            case green
            case white
            case orange
            case blue
        }
        func getHexCode(color: Color) -> String {
            switch color {
            case .red:
                return "#FF0000"
            case .green:
                return "#00FF00"
            case .white:
                return "#FFFFFF"
            case .orange:
                return "#FFA500"
            case .blue:
                return "#0000FF"
            }
        }
        // протестируем цвета
        let colors: [Color] = [.red, .green, .white, .orange, .blue]
        
        for color in colors {
            let emoji: String
            switch color {
            case .red: emoji = "🔴"
            case .green: emoji = "🟢"
            case .white: emoji = "⚪"
            case .orange: emoji = "🍊"
            case .blue: emoji = "🔵"
            }
            print("\(emoji) \(color) - HEX: \(getHexCode(color: color))")
        }
    } /* 🔴 red - HEX: #FF0000
       🟢 green - HEX: #00FF00
       ⚪ white - HEX: #FFFFFF
       🍊 orange - HEX: #FFA500
       🔵 blue - HEX: #0000FF   */
    
    static func task9_2c() {
        print("Задача 9.2.c:")
    }
    
    static func task9_2d() {
        print("Задача 9.2.d:")
    }
    static func task9_2e() {
        print("Задача 9.2.e:")
    }
    
    static func task9_2f() {
        print("Задача 9.2.f:")
    }
    
    static func task9_2g() {
        print("Задача 9.2.g:")
    }
    
    static func task9_3() {
        print("Задача 9.3: ")
    }
    static func task9_4() {
        print("Задача 9.4: ")
    }
}
