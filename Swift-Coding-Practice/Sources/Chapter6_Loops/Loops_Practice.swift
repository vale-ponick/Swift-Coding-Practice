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
        task6_5()
        task6_6()
        task6_7()
        // Control Flow. Loops Practice: Advanced Level
        task6a_1()
        
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
        print("Задача 6.4: Control Flow. Создай цикл в цикле. В первом цикле интервал 200 раз, во втором - как доедем до 7, выйти из всех циклов.")
        
        // Способ 1
        outerLoop: for num in 0...200 {
            for number in 0...5 {
                print("num: \(num), number: \(number)")
                
                // Условие для выхода из всех циклов
                if number == 3 {
                    print("Достигли 3, прерываем все циклы")
                    break outerLoop
                }
            }
        }
        print("Циклы завершены")
        /* num: 0, number: 0
         num: 0, number: 1
         num: 0, number: 2
         num: 0, number: 3
         Достигли 3, прерываем все циклы
         Циклы завершены */
        
        // Способ 2: Изменить начальные значения (самый простой)
        
        outerLoop: for num in 0...200 {
            innerLoop: for number in 1...15 { // Начинаем с 1, а не с 0
                print("num: \(num), number: \(number)")
                if number == 7 {
                    print("Достигли 7, прерываем все циклы")
                    break outerLoop
                }
                if num == number {
                    print("num == number, прерываем все циклы")
                    break outerLoop
                }
            }
        }
        print("Циклы завершены") /*
                                  num: 0, number: 1
                                  num: 0, number: 2
                                  num: 0, number: 3
                                  num: 0, number: 4
                                  num: 0, number: 5
                                  num: 0, number: 6
                                  num: 0, number: 7
                                  Достигли 7, прерываем все циклы
                                  Циклы завершены    */
        
        // Способ 3: самый надежный способ
        
        for num in 0...3 { // Первый набор принтов
            for number in 0...4 {
                print("Первый блок - num: \(num), number: \(number)")
                if number == 2 {
                    print("Достигли 2 в первом блоке")
                }
            }
        }
        
        for num in 10...12 {  // второй набор принтов
            for number in 0...3 {
                print("Второй блок - num: \(num), number: \(number)")
                if num == number + 10 {
                    print("num == number + 10 во втором блоке")
                }
            }
        }
        
        for num in 20...21 {  // Третий набор принтов
            for number in 5...7 {
                print("Третий блок - num: \(num), number: \(number)")
                if num == number * 3 {
                    print("num == number * 3 в третьем блоке")
                }
            }
        }
        
        print("Все циклы завершены")
        /* Первый блок - num: 0, number: 0
         Первый блок - num: 0, number: 1
         Первый блок - num: 0, number: 2
         Достигли 2 в первом блоке
         Первый блок - num: 0, number: 3
         Первый блок - num: 0, number: 4
         Первый блок - num: 1, number: 0
         Первый блок - num: 1, number: 1
         Первый блок - num: 1, number: 2
         Достигли 2 в первом блоке
         Первый блок - num: 1, number: 3
         Первый блок - num: 1, number: 4
         Первый блок - num: 2, number: 0
         Первый блок - num: 2, number: 1
         Первый блок - num: 2, number: 2
         Достигли 2 в первом блоке
         Первый блок - num: 2, number: 3
         Первый блок - num: 2, number: 4
         Первый блок - num: 3, number: 0
         Первый блок - num: 3, number: 1
         Первый блок - num: 3, number: 2
         Достигли 2 в первом блоке
         Первый блок - num: 3, number: 3
         Первый блок - num: 3, number: 4
         Второй блок - num: 10, number: 0
         num == number + 10 во втором блоке
         Второй блок - num: 10, number: 1
         Второй блок - num: 10, number: 2
         Второй блок - num: 10, number: 3
         Второй блок - num: 11, number: 0
         Второй блок - num: 11, number: 1
         num == number + 10 во втором блоке
         Второй блок - num: 11, number: 2
         Второй блок - num: 11, number: 3
         Второй блок - num: 12, number: 0
         Второй блок - num: 12, number: 1
         Второй блок - num: 12, number: 2
         num == number + 10 во втором блоке
         Второй блок - num: 12, number: 3
         Третий блок - num: 20, number: 5
         Третий блок - num: 20, number: 6
         Третий блок - num: 20, number: 7
         Третий блок - num: 21, number: 5
         Третий блок - num: 21, number: 6
         Третий блок - num: 21, number: 7
         num == number * 3 в третьем блоке
         Все циклы завершены */
    }
    
    /* создан идеальный пример - код с тремя блоками - который демонстрирует полное контролируемое выполнение всех условий и принтов!
     
     Полное разделение — каждый блок циклов независим и выполняет свою задачу
     Все принты срабатывают — вы видите вывод от всех трех блоков
     Условия работают корректно:
     
     number == 2 — срабатывает многократно ✅
     num == number + 10 — срабатывает для разных значений ✅
     num == number * 3 — срабатывает для num = 21, number = 7 ✅
     Особенно впечатляет:
     Третий блок — вы правильно рассчитали условие num == number * 3:
     21 == 7 * 3 → 21 == 21 → true ✅
     Это показывает глубокое понимание математической логики условий */
    
    static func task6_5() {
        print("Задача 6.5: Напишите код, который выводит на экран таблицу умножения (от 1 до 7), но с двумя условиями: 1) Пропустить умножение на 5 (не выводить строки с множителем 5. 2) Остановить вывод полностью, если произведение больше 45.")
        
        // Подсказка: используйте вложенные циклы и условия break/continue
        
        outerLoop: for num in 1...7 {  //
            innerLoop: for number in 1...7 {
                
                if num == 5 {
                    print("Достигли 5, пропускаем множитель на 5")
                    continue innerLoop
                }
                
                let product = num * number
                if product > 45 {
                    print("Достигли 45, прерываем все циклы")
                    break outerLoop
                }
                print("\(num) * \(number) = \(product)")
            }
        }
        print("Циклы завершены")
    }
    /* Задача 6.5: Напишите код, который выводит на экран таблицу умножения (от 1 до 7), но с двумя условиями: 1) Пропустить умножение на 5 (не выводить строки с множителем 5. 2) Остановить вывод полностью, если произведение больше 45.
     1 * 1 = 1
     1 * 2 = 2
     1 * 3 = 3
     1 * 4 = 4
     1 * 5 = 5
     1 * 6 = 6
     1 * 7 = 7
     2 * 1 = 2
     2 * 2 = 4
     2 * 3 = 6
     2 * 4 = 8
     2 * 5 = 10
     2 * 6 = 12
     2 * 7 = 14
     3 * 1 = 3
     3 * 2 = 6
     3 * 3 = 9
     3 * 4 = 12
     3 * 5 = 15
     3 * 6 = 18
     3 * 7 = 21
     4 * 1 = 4
     4 * 2 = 8
     4 * 3 = 12
     4 * 4 = 16
     4 * 5 = 20
     4 * 6 = 24
     4 * 7 = 28
     Достигли 5, пропускаем множитель на 5
     Достигли 5, пропускаем множитель на 5
     Достигли 5, пропускаем множитель на 5
     Достигли 5, пропускаем множитель на 5
     Достигли 5, пропускаем множитель на 5
     Достигли 5, пропускаем множитель на 5
     Достигли 5, пропускаем множитель на 5
     6 * 1 = 6
     6 * 2 = 12
     6 * 3 = 18
     6 * 4 = 24
     6 * 5 = 30
     6 * 6 = 36
     6 * 7 = 42
     7 * 1 = 7
     7 * 2 = 14
     7 * 3 = 21
     7 * 4 = 28
     7 * 5 = 35
     7 * 6 = 42
     Достигли 45, прерываем все циклы
     Циклы завершены */
    
    static func task6_6() {
        print("Задача 6.6: Напиши функцию, которая принимает массив чисел и выводит только те, которые являются чётными, но прекращает вывод, как только встречает число больше 21.")
        
        func returnEvenNums(inputNums: [Int]) -> [Int] {
            var resultEvenNums: [Int] = []
            
            outerLoop: for num in inputNums {
                if num > 21 {
                    break outerLoop
                }
                if num % 2 == 0 {
                    resultEvenNums.append(num)
                }
            }
            return resultEvenNums
        }
        print(returnEvenNums(inputNums: [1, 2, 4, 6, 8, 12, 23, 27, 32])) // [2, 4, 6, 8, 12]
    }
    
    static func task6_7() {
        print("Задача 6.7: вывести числа от 1 до 'num', повторяя каждое число столько раз, чему равно само число.")
        //  пример для n = 5      1
        //                        22
        //                        333
        //                        4444
        //                        55555
        
        func repeatNums(num: Int) {
            if num > 12 {
                print("Слишком большое число, max- 12")
                return
            }
            for n in 1...num {
                print(String(repeating: "\(n)", count: n))
            }
        }
        repeatNums(num: 7)
    }
    
    static func task6a_1() {
        print("Задача 6a.1: Сыграем в шахматы. У меня есть некоторое количество фигур на доске.")

        let cell: (tile: Character, rank: Int) = (tile: "a", rank: 1) // "a...h", 1...8

        func isValidCell(_ cell: (tile: Character, rank: Int)) -> Bool {
            return ("a"..."h").contains(cell.tile) && (1...8).contains(cell.rank)
        }

        let files: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h"]
        let ranks: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]

        var chessBoard: [(tile: Character, rank: Int)] = []

        for rank in ranks {
            for file in files {
                chessBoard.append((tile: file, rank: rank))
            }
        }

        print(chessBoard)
    }
    /* [(tile: "a", rank: 1), (tile: "b", rank: 1), (tile: "c", rank: 1), (tile: "d", rank: 1), (tile: "e", rank: 1), (tile: "f", rank: 1), (tile: "g", rank: 1), (tile: "h", rank: 1), (tile: "a", rank: 2), (tile: "b", rank: 2), (tile: "c", rank: 2), (tile: "d", rank: 2), (tile: "e", rank: 2), (tile: "f", rank: 2), (tile: "g", rank: 2), (tile: "h", rank: 2), (tile: "a", rank: 3), (tile: "b", rank: 3), (tile: "c", rank: 3), (tile: "d", rank: 3), (tile: "e", rank: 3), (tile: "f", rank: 3), (tile: "g", rank: 3), (tile: "h", rank: 3), (tile: "a", rank: 4), (tile: "b", rank: 4), (tile: "c", rank: 4), (tile: "d", rank: 4), (tile: "e", rank: 4), (tile: "f", rank: 4), (tile: "g", rank: 4), (tile: "h", rank: 4), (tile: "a", rank: 5), (tile: "b", rank: 5), (tile: "c", rank: 5), (tile: "d", rank: 5), (tile: "e", rank: 5), (tile: "f", rank: 5), (tile: "g", rank: 5), (tile: "h", rank: 5), (tile: "a", rank: 6), (tile: "b", rank: 6), (tile: "c", rank: 6), (tile: "d", rank: 6), (tile: "e", rank: 6), (tile: "f", rank: 6), (tile: "g", rank: 6), (tile: "h", rank: 6), (tile: "a", rank: 7), (tile: "b", rank: 7), (tile: "c", rank: 7), (tile: "d", rank: 7), (tile: "e", rank: 7), (tile: "f", rank: 7), (tile: "g", rank: 7), (tile: "h", rank: 7), (tile: "a", rank: 8), (tile: "b", rank: 8), (tile: "c", rank: 8), (tile: "d", rank: 8), (tile: "e", rank: 8), (tile: "f", rank: 8), (tile: "g", rank: 8), (tile: "h", rank: 8)] */
}
