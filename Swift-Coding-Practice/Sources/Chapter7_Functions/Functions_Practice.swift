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
        task7a_3()
        task7b_3()
        task7с_3()
        task7_4()
        task7_5()
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
        
        // var. 1 - Быстрая проверка (процедурный стиль)
        func combineAndSortedArrays(weather: [String], chessPieces: [String]) {
            let unitedArray = (weather + chessPieces).sorted()
            print("Это объединенный и отсортированный НОВЫЙ массив - \(unitedArray)")
        }
        combineAndSortedArrays(weather: ["Cloudy", "Foggy", "Mist", "Over all Spain the sky is cloudless", "Rainy", "Snowy", "Stormy", "Sunny", "Windy"], chessPieces: ["Bishop", "King", "Knight", "Queen", "Pawn", "Rook"]) // Это объединенный и отсортированный НОВЫЙ массив - ["Bishop", "Cloudy", "Foggy", "King", "Knight", "Mist", "Over all Spain the sky is cloudless", "Queen", "Rainy", "Pawn", "Rook", "Snowy", "Stormy", "Sunny", "Windy"]
        
        // var. 2 - Более гибкая версия (возвращает результат)
        func combineSortedArrays(weather: [String], chessPieces: [String]) -> [String] {
            return (weather + chessPieces).sorted()
        }
        let result = combineSortedArrays(weather: ["Cloudy", "Foggy", "Mist", "Over all Spain the sky is cloudless", "Rainy", "Snowy", "Stormy", "Sunny", "Windy"], chessPieces: ["Bishop", "King", "Knight", "Queen", "Pawn", "Rook"]) // Это объединенный и отсортированный НОВЫЙ массив - ["Bishop", "Cloudy", "Foggy", "King", "Knight", "Mist", "Over all Spain the sky is cloudless", "Queen", "Rainy", "Pawn", "Rook", "Snowy", "Stormy", "Sunny", "Windy"]
        print("Это объединенный и отсортированный НОВЫЙ массив - \(result)") // Это объединенный и отсортированный НОВЫЙ массив - ["Bishop", "Cloudy", "Foggy", "King", "Knight", "Mist", "Over all Spain the sky is cloudless", "Pawn", "Queen", "Rainy", "Rook", "Snowy", "Stormy", "Sunny", "Windy"]
        
        // var. 3 - Самый чистый и читаемый код! ✨
        func combiAndSortArrays(weather: [String], chess: [String]) -> [String] {
            return (weather + chess).sorted()
        }
        
        let weather = ["Cloudy", "Foggy", "Mist", "Over all Spain the sky is cloudless", "Rainy", "Snowy", "Stormy", "Sunny", "Windy"]
        let chess = ["Bishop", "King", "Knight", "Queen", "Pawn", "Rook"]
        
        let total = combiAndSortArrays(weather: weather, chess: chess)
        print("Объединенный и отсортированный массив: \(total)") // Объединенный и отсортированный массив: ["Bishop", "Cloudy", "Foggy", "King", "Knight", "Mist", "Over all Spain the sky is cloudless", "Pawn", "Queen", "Rainy", "Rook", "Snowy", "Stormy", "Sunny", "Windy"]
    }
    
    static func task7_2() {
        print("Задача 7.2: Создай журнал для учителя, который будет принимать имя студента, профессию, оценку и записывать все это в массив. Внеси 10 студентов и распечатай через цикл 'for'.")
        
        struct Student {
            let name: String
            let profession: String
            let grade: Int
            
            func isExcellent() -> Bool {
                return grade >= 90
            }
        }
        
        // Функция 1: Печать информации о студентах
        func printStudents(_ students: [Student]) {
            for student in students {
                print("Студент \(student.name), профессия \(student.profession), оценка \(student.grade)")
            }
        }
        
        // Функция 2: Анализ успеваемости
        func analyzePerformance(_ students: [Student]) {
            let excellentStudents = students.filter { $0.isExcellent() }
            let averageGrade = students.map { $0.grade }.reduce(0, +) / students.count
            
            print("=== АНАЛИЗ УСПЕВАЕМОСТИ ===")
            print("Отличники (\(excellentStudents.count) человек):")
            for student in excellentStudents {
                print("⭐️ \(student.name) - \(student.grade) баллов")
            }
            print("Средний балл группы: \(averageGrade)")
        }
        
        // Функция 3: Главная функция, которая объединяет остальные
        func executeTask() {
            let students = [
                Student(name: "Ann", profession: "IT", grade: 91),
                Student(name: "Bob", profession: "IT", grade: 75),
                Student(name: "Sam", profession: "IT", grade: 99),
                Student(name: "Alice", profession: "Design", grade: 88),
                Student(name: "John", profession: "Marketing", grade: 82),
                Student(name: "Emma", profession: "IT", grade: 95),
                Student(name: "Mike", profession: "Finance", grade: 79),
                Student(name: "Lisa", profession: "Design", grade: 90),
                Student(name: "Tom", profession: "Marketing", grade: 85),
                Student(name: "Sarah", profession: "IT", grade: 92)
            ]
            
            printStudents(students)    // Одно действие
            analyzePerformance(students) // Другое действие
        }
        executeTask()
        
        /* Задача 7.2: Создай журнал для учителя, который будет принимать имя студента, профессию, оценку и записывать все это в массив. Внеси 10 студентов и распечатай через цикл 'for'.
         Студент Ann, профессия IT, оценка 91
         Студент Bob, профессия IT, оценка 75
         Студент Sam, профессия IT, оценка 99
         Студент Alice, профессия Design, оценка 88
         Студент John, профессия Marketing, оценка 82
         Студент Emma, профессия IT, оценка 95
         Студент Mike, профессия Finance, оценка 79
         Студент Lisa, профессия Design, оценка 90
         Студент Tom, профессия Marketing, оценка 85
         Студент Sarah, профессия IT, оценка 92
         === АНАЛИЗ УСПЕВАЕМОСТИ ===
         Отличники (5 человек):
         ⭐️ Ann - 91 баллов
         ⭐️ Sam - 99 баллов
         ⭐️ Emma - 95 баллов
         ⭐️ Lisa - 90 баллов
         ⭐️ Sarah - 92 баллов */
        
        // var. 2 БЕЗ лишней вложенности
        
        struct Schoolchild {
            let name: String
            let classSpecialization: String
            let grade: Int
            
            func isExcellent() -> Bool {
                return grade == 5
            }
        }
        
        func printSchoolchildren(_ schoolchildren: [Schoolchild]) {
            for schoolchild in schoolchildren {
                print("Ученик \(schoolchild.name), класс \(schoolchild.classSpecialization), оценка \(schoolchild.grade)")
            }
        }
        
        func analyzePerformance(_ schoolchildren: [Schoolchild]) {
            let excellentChildren = schoolchildren.filter { $0.isExcellent() }
            _ = schoolchildren.map { $0.grade }.reduce(0, +) / schoolchildren.count
            
            print("=== АНАЛИЗ УСПЕВАЕМОСТИ ===")
            print("Отличники (\( excellentChildren.count) человек):")
            
            for child in excellentChildren {
                print("⭐️ \(child.name) - \(child.grade) баллов")
            }
        }
        
        // ✅ ПРОСТО ВЫПОЛНЯЕМ КОД ПРЯМО ЗДЕСЬ:
        let schoolchildren = [
            Schoolchild(name: "Иван", classSpecialization: "A", grade: 3),
            Schoolchild(name: "Степан", classSpecialization: "B", grade: 3),
            Schoolchild(name: "Костя", classSpecialization: "A", grade: 4),
            Schoolchild(name: "Aндрей", classSpecialization: "С", grade: 3),
            Schoolchild(name: "Федор", classSpecialization: "С", grade: 4),
            Schoolchild(name: "Женя", classSpecialization: "B", grade: 5),
            Schoolchild(name: "Кирилл", classSpecialization: "A", grade: 4),
            Schoolchild(name: "Витя", classSpecialization: "С", grade: 5),
        ]
        let averageGrade = Double(schoolchildren.map { $0.grade }.reduce(0, +)) / Double(schoolchildren.count)
        
        printSchoolchildren(schoolchildren)
        analyzePerformance(schoolchildren)
        print("Средний балл класса: \(String(format: "%.1f", averageGrade))")
    }
    /*  Ученик Иван, класс A, оценка 3
     Ученик Степан, класс B, оценка 3
     Ученик Костя, класс A, оценка 4
     Ученик Aндрей, класс С, оценка 3
     Ученик Федор, класс С, оценка 4
     Ученик Женя, класс B, оценка 5
     Ученик Кирилл, класс A, оценка 4
     Ученик Витя, класс С, оценка 5
     === АНАЛИЗ УСПЕВАЕМОСТИ ===
     Отличники (2 человек):
     ⭐️ Женя - 5 баллов
     ⭐️ Витя - 5 баллов
     Средний балл класса: 3.9   */
    
    static func task7_3() {
        print("Задача 7.1: Создай функцию, которая принимает имя и фамилию, потом положить все это в МАССИВ и вывести результат в консоль.")
        
        // вар. 1 возвращаем МАССИВ
        struct Person {
            let name: String
            let surname: String
            let age: String
        }
        
        func add(name: String, surname: String, age: String) -> [String] {
            return [name, surname, age]
        }
        let humanInfo = add(name: "Joe", surname: "Smith", age: "41")
        print(humanInfo) // ["Joe", "Smith", "41"]
    }
    
    static func task7a_3() {
        print("Задача 7.1: Создай функцию, которая принимает имя и фамилию, потом положить все это в МАССИВ и вывести результат в консоль.")
        
        // вар. 2 это МАССИВ СТРУКТУР
        
        struct Beatle {
            let name: String
            let instrument: String
            let role: String
            let birthYear: Int
            let signatureSong: String
        }
        
        func getAllBeatles() -> [Beatle] {
            return [
                Beatle(name: "John Lennon", instrument: "guitar", role: "singer", birthYear: 1940, signatureSong: "Imagine"),
                Beatle(name: "Paul McCartney", instrument: "bass", role: "singer", birthYear: 1942, signatureSong: "Yesterday"),
                Beatle(name: "George Harrison", instrument: "guitar", role: "lead guitar", birthYear: 1943, signatureSong: "Here Comes the Sun"),
                Beatle(name: "Ringo Starr", instrument: "drums", role: "drummer", birthYear: 1940, signatureSong: "With a Little Help from My Friends")
            ]
        }
        
        let beatles = getAllBeatles()
        
        beatles.forEach { beatle in
            print("🎵 \(beatle.name)")
            print("   Instrument: \(beatle.instrument)")
            print("   Signature Song: \(beatle.signatureSong)")
            print("   BirthYear: \(beatle.birthYear)")
            print("---")
        }
    } /* 🎵 John Lennon
       Instrument: guitar
       Signature Song: Imagine
       BirthYear: 1940
       ---
       🎵 Paul McCartney
       Instrument: bass
       Signature Song: Yesterday
       BirthYear: 1942
       ---
       🎵 George Harrison
       Instrument: guitar
       Signature Song: Here Comes the Sun
       BirthYear: 1943
       ---
       🎵 Ringo Starr
       Instrument: drums
       Signature Song: With a Little Help from My Friends
       BirthYear: 1940  */
    
    
    static func task7b_3() {
        print("Задача 7.1: Создай функцию, которая принимает имя и фамилию, потом положить все это в МАССИВ и вывести результат в консоль.")
        // var. 3 - это МАССИВ СЛОВАРЕЙ
        
        func getABBA() -> [[String: Any]] {
            return [
                [
                    "name": "Agnetha Fältskog",
                    "instrument": "vocals",
                    "role": "soprano",
                    "birthYear": 1950,
                    "signatureSong": "Dancing Queen"
                ],
                [
                    "name": "Björn Ulvaeus",
                    "instrument": "guitar",
                    "role": "composer",
                    "birthYear": 1945,
                    "signatureSong": "Mamma Mia"
                ],
                [
                    "name": "Benny Andersson",
                    "instrument": "keyboard",
                    "role": "composer",
                    "birthYear": 1946,
                    "signatureSong": "Waterloo"
                ],
                [
                    "name": "Anni-Frid Lyngstad",
                    "instrument": "vocals",
                    "role": "alto",
                    "birthYear": 1945,
                    "signatureSong": "The Winner Takes It All"
                ]
            ]
        }
        
        func printABBA() {
            getABBA().forEach { member in
                print("🎤 \(member["name"] ?? "Unknown")")
                print("   Instrument: \(member["instrument"] ?? "Unknown")")
                print("   Signature Song: \(member["signatureSong"] ?? "Unknown")")
                print("---")
            }
        }
        printABBA()
    } /*  🎤 Agnetha Fältskog
       Instrument: vocals
       Signature Song: Dancing Queen
       ---
       🎤 Björn Ulvaeus
       Instrument: guitar
       Signature Song: Mamma Mia
       ---
       🎤 Benny Andersson
       Instrument: keyboard
       Signature Song: Waterloo
       ---
       🎤 Anni-Frid Lyngstad
       Instrument: vocals
       Signature Song: The Winner Takes It All
       --- */
    
    static func task7с_3() {
        print("\n=== Вариант 1: Массив массивов (Queen) ===")
        
        func getQueen() -> [[String]] {
            return [
                ["Freddie Mercury", "vocals", "singer", "1946", "Bohemian Rhapsody"],
                ["Brian May", "guitar", "lead guitar", "1947", "We Will Rock You"],
                ["John Deacon", "bass", "bassist", "1951", "Another One Bites the Dust"],
                ["Roger Taylor", "drums", "drummer", "1949", "Radio Ga Ga"]
            ]
        }
        
        let queen = getQueen()
        
        queen.forEach { member in
            print("🎸 \(member[0])")          // имя
            print("   Instrument: \(member[1])") // инструмент
            print("   Role: \(member[2])")      // роль
            print("   Birth Year: \(member[3])") // год рождения
            print("   Hit Song: \(member[4])")   // песня
            print("---")
        }
    } /* === Вариант 1: Массив массивов (Queen) ===
       🎸 Freddie Mercury
          Instrument: vocals
          Role: singer
          Birth Year: 1946
          Hit Song: Bohemian Rhapsody
       ---
       🎸 Brian May
          Instrument: guitar
          Role: lead guitar
          Birth Year: 1947
          Hit Song: We Will Rock You
       ---
       🎸 John Deacon
          Instrument: bass
          Role: bassist
          Birth Year: 1951
          Hit Song: Another One Bites the Dust
       ---
       🎸 Roger Taylor
          Instrument: drums
          Role: drummer
          Birth Year: 1949
          Hit Song: Radio Ga Ga
       --- */
    
    static func task7_4() {
        print("Задача 7.1: Создай функцию, которая принимает параметры и вычисляет площадь круга.")
    }
    static func task7_5() {
        print("Задача 7.1: Создай словарь с именами учеников, где ключ - name, а значение - (1 tuple из 5 имен) и (2 кортеж из 5 оценок). Распечатай только имена по ключу.")
    }
}

