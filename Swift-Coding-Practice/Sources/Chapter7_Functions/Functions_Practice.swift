//
//  Functions-Practice.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 16.09.2025.
//
import Foundation

public struct Chapter7_Functions {
    public static func runAllTasks() {
        print("=== Глава 7: Функции ===")
        task7_1()
        task7_2()
        task7_3()
        task7_4()
        task7_5()
        // Functions: Advanced Level
        task7a_1()
        task7a_2()
        task7a_3()
    } // Добавляй новые задачи тут
    
    static func task7_1() {
        print("Задача 7.1: Создай три функции: 1-ая функция принимает массив Int и сортирует его по порядку(возрастание). После - распечатывает в консоль. 2-ая функция принимает массив String, меняет 1, 2 и 3 элементы и сортирует по алфавиту. После - распечатывает в консоль. 3-я функция принимает два массива строк и складывает их. После - распечатывает в консоль.")
        
        // var 1 меняем исходный массив
        func first(nums: [Int]) {
            let numsSorted = nums.sorted(by: <)
            print(numsSorted)
        }
        first(nums: [1, 4, 2, 7, 3, 8, 1, 9, 2]) // [1, 1, 2, 2, 3, 4, 7, 8, 9]
        
        func second(figures: inout [String]) {
            if figures.count >= 3 {
                (figures[0], figures[1], figures[2]) = (figures[1], figures[2], figures[0]) // Меняем местами первый, второй и третий элементы
                print(figures) //["Queen", "Rook", "King", "Bishop", "Knight", "Rawn"]
                figures.sort()
            }
        }
        var chessPieces = ["King", "Queen", "Rook", "Bishop", "Knight", "Rawn"]
        
        second(figures: &chessPieces)
        print(chessPieces) // ["Bishop", "King", "Knight", "Queen", "Rawn", "Rook"]
        
        // вар.2 создаем НОВЫЙ массив
        
        func second(types: [String]) -> [String] {
            
            guard types.count >= 3 else { return types.sorted() }
            var result = types
            (result[0], result[1], result[2]) = (result[1], result[2], result[0])
            return result.sorted()
        }
      
        let weatherPieces = ["Sunnny", "Cloudly", "Rainy", "Snowy", "Windy", "Foggy", "Stormy", "Mist", "Over all Spain the sky is clouless"]
let res = second(types: weatherPieces)
print(res) // ОТСОРТИРОВАННЫЙ массив ПОСЛЕ замены первых 3-х элементов: ["Cloudly", "Foggy", "Mist", "Over all Spain the sky is clouless", "Rainy", "Snowy", "Stormy", "Sunnny", "Windy"]
print(weatherPieces) // ИСХОДНЫЙ НЕизменный массив: ["Sunnny", "Cloudly", "Rainy", "Snowy", "Windy", "Foggy", "Stormy", "Mist", "Over all Spain the sky is clouless"]
    /* Ключевые различия:
     
     Inout (шахматы)    Возврат массива (погода)
     Изменяет исходный?    ✅ Да    ❌ Нет
     Защита guard?    ❌ Не обязательно    ✅ Обязательно
     Пустой массив?    Ничего не происходит    Возвращает пустой массив
     Когда использовать?    Когда нужно изменить исходные данные    Когда исходные данные должны остаться неизменными
     Почему в погодном варианте guard важнее:

     Функция должна вернуть результат в любом случае
     Если массив пустой/короткий - нужно вернуть что-то осмысленное
     guard гарантирует, что мы обработаем все возможные случаи
     Ты абсолютно права! 👏 Отличное наблюдение!
     feat: добавлены две версии функции для работы с массивами

     - Inout версия: изменяет исходный массив (подход мутации)
     - Guard версия: возвращает новый массив (функциональный подход)
     - Обе функции выполняют замену элементов и сортировку
     - Добавлена обработка edge cases через guard */
}
    
    static func task7_2() {
        print("Задача 7.1: Создай ...")
    }
    static func task7_3() {
        print("Задача 7.1: Создай ...")
    }
    static func task7_4() {
        print("Задача 7.1: Создай ...")
    }
    static func task7_5() {
        print("Задача 7.1: Создай ...")
    }
    // Functions: Advanced Level
    static func task7a_1() {
        print("Задача 7.1: Создай ...")
    }
    static func task7a_2() {
        print("Задача 7.1: Создай ...")
    }
    static func task7a_3() {
        print("Задача 7.1: Создай ...")
    }
}
