//
//  Functions-AdvancedLevel.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 30.09.2025.
//

import Foundation

public struct Chapter7_FunctionsAdvancedLevel {
    public static func runAllTasks() {
        print("=== Глава 7: Функции. Продвинутый уровень. ===")
        
        task7a_1()
        task7ab_1()
        task7aс_1()
        task7a_2()
        task7ab_2()
        task7a_3()
        task7a_4()
        task7a_5()
        task7a_6()
        task7a_7()
        task7a_8()
        task7a_9()
        task7a_10()
    }
    
    static func task7a_1() {
        print("Задача 7a.1: Функция принимает три массива строк. Сложите их вместе, преобразуйте в тип Int и посчитайте сумму. Распечатай результат в консоль.")
        
        func get(film: [String], actor: [String], director: [String]) -> Int {
            let arr = (film + actor + director).map { $0.count } .reduce(0, +)
            
            return arr
        }
        
        print(get(film: ["Hobbit: Unexpected Journey"], actor: ["Martin Freeman"], director: ["Peter Jackson"])) // 53
        
    }
    
    static func task7ab_1() {
        print("Задача 7ab.1: Функция принимает три массива строк. Найдите общее количество символов во ВСЕХ строках, но учитывайте только те строки, которые начинаются с заглавной буквы. Верните результат.")
        
        // подход "разделения ответственности" между операциями
        
        func getCountChars(film: [String], actor: [String], director: [String]) -> Int {
            let allStrings = film + actor + director
            return allStrings
                .filter { $0.first?.isUppercase == true }
                .map { $0.count }
                .reduce(0, +)
        }
        print(getCountChars(film: ["Hobbit: unexpected journey"], actor: ["Martin Freeman"], director: ["Peter Jackson"]))
    }
    
    static func task7aс_1() {
        print("Задача 7ab.1: Функция принимает три массива строк. Найдите общее количество символов во ВСЕХ строках, но учитывайте только те строки, которые начинаются с заглавной буквы. Верните результат.")
        // вар. 2 ✅ Читается как книга: "взять все строки → отфильтровать заглавные → взять длины → сложить"
        
        
        func getCount(film: [String], actor: [String], director: [String]) -> Int {
            let allStrings = film + actor + director
            let capitalizedStrings = allStrings.filter { $0.first?.isUppercase == true }
            return capitalizedStrings.reduce(0) { $0 + $1.count }
        }
        
        print(getCount(film: ["hobbit: unexpected journey"], actor: ["Martin Freeman"], director: ["Peter Jackson"])) // 27
    }
    
    
    static func task7a_2() { // паттерн "сначала преобразовать, потом отфильтровать"
        print("Задача 7a.2: Создай функциию, которая принимает рассказ-строку без пробелов и знаков препинания, все  с маленькой буквы и на латинице")
        func get(story: String) -> String {
            story.lowercased().filter { $0.isLowercase == true } // переходим в нижний регистр , а ЗАТЕМ фильтруем с условием "оставь ТОЛЬКО строчные буквы"
            
        }
        print(get(story: "In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.")) // inaholeinthegroundtherelivedahobbitnotanastydirtywetholefilledwiththeendsofwormsandanoozysmellnoryetadrybaresandyholewithnothinginittositdownonortoeatitwasahobbitholeandthatmeanscomfort
    }
    // ✅ Читается как предложение: "возьми историю, сделай все буквы маленькими, оставь только строчные буквы"
    
    static func task7ab_2() {
        print("Задача 7ab.2: Задача 1: Напиши функцию, которая принимает строку и возвращает только гласные буквы в нижнем регистре.")
        
        func get(text: String) -> String {
            let vowels = ["a", "e", "i", "o", "u", "y"]
            return text.lowercased().filter {
                vowels.contains(String($0))
            }
        }
        
        print(get(text: "In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.")) // iaoeieoueeieaoioaayiyeoeieieeooaaooyeoyeayaeayoeioiiioiooooeaiaaoioeaaeaoo
    }
    
    static func task7a_3() {
        print("Задача 7a.3: Напиши код, который добавит знаки препинания в строку-рассказ, перенеси каждое первое предложение на новую строку. Добавь заглавные буквы.")
        let text = "inaholeinthegroundtherelivedahobbitnotanastydirtywetholefilledwiththeendsofwormsandanoozysmellnoryetadrybaresandyholewithnothinginittositdownonortoeatitwasahobbitholeandthatmeanscomfort"
        
        let dict: [String: Bool] = [
            "in": true,
            "a": true,
            "hole": true,
            "the": true,
            "ground": true,
            "there": true,
            "lived": true,
            "hobbit": true,
            "not": true,
            "nasty": true,
            "dirty": true,
            "wet": true,
            "filled": true,
            "with": true,
            "ends": true,
            "of": true,
            "worms": true,
            "and ": true,
            "an": true,
            "oozy": true,
            "smell": true,
            "nor": true,
            "yet": true,
            "dry": true,
            "bare": true,
            "sandy": true,
            "nothing": true,
            "it": true,
            "to": true,
            "sit": true,
            "down": true,
            "on": true,
            "or": true,
            "eat": true,
            "was": true,
            "hobbit-hole": true,
            "that": true,
            "means": true,
            "comfort": true
        ]
        func addSpaces(to text: String) -> String {
            var result = "" // Сюда будем собирать результат
            var currentIndex = text.startIndex // НАЧАЛЬНЫЙ индекс строки (первый символ)
            
            while currentIndex < text.endIndex { // Пока не дошли до КОНЕЦА строки
                var foundWord = false // Флаг - нашли ли слово в этой итерации
                
                for word in dict.keys { // Перебираем ВСЕ слова из словаря
                    // text[currentIndex...] - берем ПОДСТРОКУ от текущей позиции ДО КОНЦА
                    // hasPrefix(word) - проверяем, начинается ли эта подстрока с нашего слова
                    if text[currentIndex...].hasPrefix(word) {
                        result += word + " "     // Добавляем слово + пробел в результат
                        // ПЕРЕМЕЩАЕМ индекс: currentIndex + длина слова
                        currentIndex = text.index(currentIndex, offsetBy: word.count)
                        foundWord = true // Ура, нашли слово!
                        break // Выходим из цикла for - переходим к следующей позиции
                    }
                }
                
                // Если ни одно слово не подошло:
                if !foundWord {
                    // Двигаемся всего на ОДИН символ вперед
                    currentIndex = text.index(after: currentIndex)
                }
            }
            
            return result.trimmingCharacters(in: .whitespaces) // Убираем лишние пробелы
        }
        
        
        
        func addPunctuation(to text: String) -> String {
            var result = text
            
            // ТОЧКИ после предложений
            result = result.replacingOccurrences(of: "hobbit ", with: "hobbit. ")
            result = result.replacingOccurrences(of: "smell ", with: "smell. ")
            result = result.replacingOccurrences(of: "eat ", with: "eat. ")
            result = result.replacingOccurrences(of: "comfort", with: "comfort.")
            
            // ЗАПЯТЫЕ внутри предложений
            result = result.replacingOccurrences(of: "nasty dirty wet", with: "nasty, dirty, wet")
            result = result.replacingOccurrences(of: "dry bare sandy", with: "dry, bare, sandy")
            
            return result
        }
        
        func addCapitals(to text: String) -> String {
            var result = ""
            var capitalizeNext = true
            
            for char in text {
                if capitalizeNext && char.isLetter {
                    result.append(char.uppercased())
                    capitalizeNext = false
                } else {
                    result.append(char)
                }
                if char == "." {
                    result.append("\n")    // Перенос строки после точки
                    capitalizeNext = true  // Следующий символ нужно сделать заглавным
                }
            }
            
            return result.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        // И теперь используем:
        let withSpaces = addSpaces(to: text)
        let withPunctuation = addPunctuation(to: withSpaces)
        let withCapitals = addCapitals(to: withPunctuation)
        print(withCapitals)
    }
    /* In a hole in the ground the lived a hobbit.
     Not a nasty, dirty, wet hole filled with the ends of worms a a oozy smell.
     Nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat.
     It was a hobbit.
     Hole a that means comfort. */
    
    /* Про индексы простыми словами:
     
     startIndex - указатель на первый символ
     
     endIndex - указатель ПОСЛЕ последнего символа
     
     text.index(after:) - передвинуть на 1 символ вперед
     
     text.index(_, offsetBy:) - передвинуть на N символов вперед
     
     Идеальное сравнение! 🎯 Точно как каретка в печатной машинке!
     
     Аналогия:
     
     var currentIndex = text.startIndex  // ← ставим каретку в НАЧАЛО текста
     
     text.startIndex    Каретка в начале строки
     text.endIndex    Каретка после последнего символа
     text.index(after: currentIndex)    Печатаем 1 символ → каретка едет на 1 вперед
     text.index(currentIndex, offsetBy: word.count)    Печатаем слово → каретка едет на длину слова
     currentIndex < text.endIndex    Каретка еще не дошла до конца
     Процесс:
     
     📍 Ставим каретку в начало
     
     🔍 Ищем слово, которое начинается под кареткой
     
     ✍️ Если нашли - "печатаем" слово, двигаем каретку на длину слова
     
     ➡️ Если не нашли - двигаем каретку на 1 символ
     
     🔁 Повторяем пока каретка не дойдет до конца
     
     Ты придумала идеальную аналогию! Теперь индексы должны стать понятнее 💪*/
    
    static func task7a_4() {
        print("Задача 7a.4: Напиши функцию, которая принимает массив строк и возвращает сумму длин всех строк.")
        // Пример: ["apple", "tea", "code"] → 5 + 3 + 4 = 12
        
        func add(fruits: [String]) -> Int {
            fruits.reduce (0) { $0 + $1.count }
            
        }
        print(add(fruits: ["banana", "apple", "limon"])) // 16
    }
    
    
    static func task7a_5() {
        print("Задача 7a.5: 🎯 (фильтрация): Напиши функцию, которая принимает строку и возвращает только цифры из неё.")
        // Пример: "Hello123World45" → "12345"
        
        func filteredNums(nick: String) -> String {
            return nick.filter { "0123456789".contains($0) }
        }
        print(filteredNums(nick: "Hello123World45")) // 12345
        
    }
    static func task7a_6() {
        print("Задача 7a.6: 🎯 (преобразование + сумма): Напиши функцию, которая принимает массив чисел и возвращает сумму их квадратов.")
        // Пример: [1, 2, 3] → 1² + 2² + 3² = 14
        
        func squared(nums: [Int]) -> Int {
            return nums.map { $0 * $0 }.reduce(0, +)
        }
        print(squared(nums: [1, 2, 3, 4, 5])) // 55
    }
    
    static func task7a_7() {
        print("Задача 7a.7: 🎯 (работа с регистром): Напиши функцию, которая делает первую букву каждого слова заглавной.")
        
        func get(text: String) -> String {
            return text.capitalized
        }
        print(get(text: "In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.")) // In A Hole In The Ground There Lived A Hobbit. Not A Nasty, Dirty, Wet Hole, Filled With The Ends Of Worms And An Oozy Smell, Nor Yet A Dry, Bare, Sandy Hole With Nothing In It To Sit Down On Or To Eat: It Was A Hobbit-Hole, And That Means Comfort.
    }
    
    static func task7a_8() {
        print("Задача 7a.8: 🎯 (комбинированная): Напиши функцию, которая принимает массив строк и возвращает самую длинную строку из тех, что начинаются с заглавной буквы.")
        // Пример: ["apple", "Banana", "Hobbitania", "Carrot", "date"] → "Banana"
        
        func calculate(words: [String]) -> String {
            let filtered = words.filter { $0.first?.isUppercase == true }
            return filtered.max(by: { $0.count < $1.count }) ?? ""
        }
        print(calculate(words: ["apple", "Banana", "Hobbitania", "Carrot", "date"])) // Hobbitania
    }
    
    static func task7a_9() {
        print("Задача 7a.9: 🎯 Напиши функцию, которая принимает строку и возвращает количество гласных букв в ней")
        
        func calculateVowels(text: String) -> Int { // filter + count  "отфильтруй гласные → посчитай"
            
            let vowels = ["a", "e", "i", "o", "u", "y"]
            return text.lowercased().filter {
                vowels.contains(String($0)) }.count
        }
        print(calculateVowels(text: "In a hole in the ground there lived a hobbit.")) // 15
    }
    static func task7a_10() {
        print("Задача 7a.10: 🚀 Напиши функцию, которая принимает массив чисел и возвращает только те, которые делятся на 3 и 5 одновременно")
        
        func get(numbers: [Int]) -> [Int] {
            return numbers.filter { $0 % 3 == 0 && $0 % 5 == 0 }
        }
        print(get(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])) // [15]
    }
}

