//
//  Loops_Practice.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 19.09.2025.
//
import Foundation

public struct Chapter6_Loops {
    public static func runAllTasks() {
        print("=== Глава 6: Управление потоком: циклы ===")
        task6_1()
        task6_2()
        task6_3()
        task6_4()
        // Control Flow. Loops Practice: Advanced Level
        
        
    } // Добавляй новые задачи тут
    
    static func task6_1() {
        print("Задача 5.1: Создай массив 'дни в месяцах'. Распечатай элементы, содержащие количество дней в соответствующем месяце, используя цикл 'for' и этот массив.")
        let daysInMonth: [(String, Int)] = [
            ("january", 31),
            ("february", 28),
            ("march", 31),
            ("april", 30),
            ("may", 31),
            ("june", 30),
            ("july", 31),
            ("august", 31),
            ("september", 30),
            ("october", 31),
            ("november", 30),
            ("december", 31)
        ]
        for month in daysInMonth {
            print("В месяце \(month.0) количество дней равно \(month.1)")
        }
        /* === Глава 6: Управление потоком: циклы ===
         Задача 5.1: Создай массив 'дни в месяцах'. Распечатай элементы, содержащие количество дней в соответствующем месяце, используя цикл 'for' и этот массив.
         В месяце january количество дней равно 31
         В месяце february количество дней равно 28
         В месяце march количество дней равно 31
         В месяце april количество дней равно 30
         В месяце may количество дней равно 31
         В месяце june количество дней равно 30
         В месяце jule количество дней равно 31
         В месяце august количество дней равно 31
         В месяце september количество дней равно 30
         В месяце october количество дней равно 31
         В месяце november количество дней равно 30
         В месяце december количество дней равно 31 */
        
        // var 2. используй распаковку кортежа прямо в цикле:
        for (name, days) in daysInMonth { print("В месяце \(name)  - \(days)") }
        /* В месяце january  - 31
         В месяце february  - 28
         В месяце march  - 31
         В месяце april  - 30
         В месяце may  - 31
         В месяце june  - 30
         В месяце july  - 31
         В месяце august  - 31
         В месяце september  - 30
         В месяце october  - 31
         В месяце november  - 30
         В месяце december  - 31*/
        
    }
    static func task6_2() {
        print("Задача 6.2: Создай в 'if' и отдельно в 'switch' программу, которая будет смотреть на возраст человека и говорить куда ему идти: в школу, в садик, в универ, на работу или на пенсию.")
        
        let age = 21
        
        if age > 2 && age < 7 {
            print("Ты малыш, иди в садик")
        } else if age >= 7 && age < 18 {
            print("Ты ребенок, иди в школу")
        } else if age >= 18 && age < 25 {
            print("Ты молодой человек, иди в университет")
        } else if age >= 25 && age < 65 {
            print("Ты взрослый, работай!")
        } else {
            print("Отдыхай, ты на пенсии")
        }
        // вар. 2 switch
        switch age {
        case 2...6:
            print("Ты малыш, иди в садик")
        case 7...17:
            print("Ты ребенок, иди в школу")
        case 18...24:
            print("Ты молодой человек, иди в университет")
        case 25...65:
            print("Ты взрослый, работай!")
        default:
            print("Отдыхай, ты на пенсии")
        } // Ты молодой человек, иди в университет
    }
    static func task6_3() {
        print("Задача 6.3: Создай в 'if' и отдельно в 'switch' систему оценивания школьников по 12-балльной системе и высказывай свое мнение через принт.")
        // вар. 1 switch
        
        var grade = 12
        if !(1...12).contains(grade) {
            print("Такой оценки нет")
            return
        }
        switch grade {
        case 1...4:
            print("Ужасно!")
        case 5...6:
            print("Слабо")
        case 7...11:
            print("Хорошо")
        case 12:
            print("Ты - молодец! Отлично!")
        default:
            break // Здесь не попадем
        }
        
        // вар. 1 'if - else'
        grade = 13
        
        // Система оценивания через if
           if grade < 1 || grade > 12 {
               print("Такой оценки нет")
           } else if grade <= 3 {
               print("Очень плохо")
           } else if grade <= 5 {
               print("Плохо")
           } else if grade <= 7 {
               print("Удовлетворительно")
           } else if grade <= 9 {
               print("Хорошо")
           } else if grade <= 11 {
               print("Очень хорошо")
           } else {
               print("Отлично!")
           }
    }
        static func task6_4() {
            print("Задача 6.4: Control Flow. Создай цикл в цикле. В первом цикле интервал 200 раз, во втором - как доедем до 15, выйти из всех циклов.")
            outerLoop: for num in 0...200 {
                innerLoop: for number in 0...15 {
                    print("num = \(num), number = \(number)")  // отладочный вывод
                    
                    if number == 15 {
                        print("Достигли 15, прерываем все циклы")
                        break outerLoop
                    }
                    if num == number {
                        print("num == number, прерываем все циклы")
                        break outerLoop
                    }
                }
            }
            print("Циклы завершены")
    }
}
