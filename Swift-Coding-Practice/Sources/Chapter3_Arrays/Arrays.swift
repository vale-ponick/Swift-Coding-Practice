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
        // Arrays: Advanced Level
        task3a_1()
        task3ab_1()
        task3ac_1()
        task3a_2()
        task3ab_2()
        task3ac_2()
        task3ad_2()
        task3ae_2()
        task3a_2_swiftStyle()
        task3a_2_functional()
        task3a_2_perfect()
        task3a_2_compact()
        task3a_3()
        task3a_4()
        task3a_5()
        task3a_6()
        task3a_7()
        task3ab_7()
        task3aс_7()
        task3ad_7()
        task3ae_7()
        task3af_7()
        
        // Добавляйте новые задачи тут
    }
    
    static func task3_1() {
        print("Задача 3.1: ..")
    }
    
    static func task3_2() {
        print("Задача 3.2:...")
        let original = "Hello"
        let reversed = String(original.reversed())
        print("Оригинал: \(original), Реверс: \(reversed)")
    }
    
    static func task3_3() {
        print("Задача 3.3: ..")
    }
    static func task3_4() {
        print("Задача 3.4: ..")
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
    
    // Arrays: Advanced Level
    
    static func task3a_1() {
        print("Задача 3a.1: Создай 10 строк с названиями стран. Создай массив.")
        // Option 1:
        let france = "France"
        let italy = "Italy"
        let germany = "Germany"
        let czechRepublic = "Czech Republic"
        let denmark = "Denmark"
        let croatia = "Croatia"
        let ireland = "Ireland"
        let austria = "Austria"
        let sweden = "Sweden"
        let poland = "Poland"
        
        var euCountries: [String] = []
        
        euCountries.append(france)
        euCountries.append(contentsOf: [italy, germany, czechRepublic])
        euCountries.append(contentsOf: [denmark, croatia, ireland, austria, sweden, poland])
        
        print(euCountries) // ["France", "Italy", "Germany", "Czech Republic", "Denmark", "Croatia", "Ireland", "Austria", "Sweden", "Poland"]
        
        // Option 2:
        let europeanUnion = [
            "France",
            "Italy",
            "Germany",
            "Czech Republic",
            "Denmark",
            "Croatia",
            "Ireland",
            "Austria",
            "Sweden",
            "Poland"
        ]
        print(europeanUnion) // ["France", "Italy", "Germany", "Czech Republic", "Denmark", "Croatia", "Ireland", "Austria", "Sweden", "Poland"]
    }
    
    static func task3ab_1() {
        print("Задача 3a.1: Проверь строки, если в строке > 5 символов - добавь ее в массив. Но если строка содержит букву А, замени эту букву на другую и добавь измененную строку с массив.")
        
        var resultArray: [String] = []
        
        // option 1: Loop with replacement logic
        
        let europeanUnion = [
            "France",
            "Italy",
            "Germany",
            "Czech Republic",
            "Denmark",
            "Croatia",
            "Ireland",
            "Austria",
            "Sweden",
            "Poland"
        ]
        for country in europeanUnion {
            if country.count > 6 {
                if country.contains("A") || country.contains("a") {
                    let modifiedCountry = country.replacingOccurrences(of: "a", with: "Y", options: .caseInsensitive)
                    resultArray.append(modifiedCountry)
                } else {
                    resultArray.append(country)
                }
            }
        }
        print("Option 1 result: \(resultArray)") // Option 1 result: ["GermYny", "Czech Republic", "DenmYrk", "CroYtiY", "IrelYnd", "YustriY"]
        
        // Option 2: Functional style
        
        let resArray = europeanUnion.filter { $0.count > 6 }.map { country in
            if country.contains("a") || country.contains("A") {
                return country.replacingOccurrences(of: "a", with: "Y", options: .caseInsensitive)
            } else {
                return country
            }
        }
        print("Option 2 result: \(resArray)") // Option 2 result: ["GermYny", "Czech Republic", "DenmYrk", "CroYtiY", "IrelYnd", "YustriY"]
        
        // COMMENTS:
        /*  Что делает код:
         
         1. filter { $0.count > 6 } - отбирает страны длиннее 6 символов
         2. map { ... } - преобразует каждую страну по правилу:
         
         Если есть 'A' или 'a' → заменяет на 'Y'
         Если нет → оставляет как есть  */
        
        // Option 3
        let modifyArray = europeanUnion
            .filter { $0.count > 6 }
            .map { $0.replacingOccurrences(of: "a", with: "Y", options: .caseInsensitive) }
        print(modifyArray) // ["GermYny", "Czech Republic", "DenmYrk", "CroYtiY", "IrelYnd", "YustriY"]
        
    }
    static func task3ac_1() {
        print("Задача 3a.3: Найти все страны, которые заканчиваются на букву 'y' и перевести их в верхний регистр")
        
        // option 1: 🐢 'Imperative style'
        
        let euroUnion = [
            "France",
            "Czech Republic",
            "Italy",
            "Denmark",
            "Croatia",
            "Ireland",
            "Austria",
            "Sweden",
            "Poland"
        ]
        
        var upperResult: [String] = []
        for country in euroUnion {
            if country.hasSuffix("y") {
                upperResult.append(country.uppercased())
            }
        }
        print(upperResult) // ["ITALY"]
        
        // option 2: 🦅 'Functional style'
        let upperRes = euroUnion
            .filter { $0.last == "y" }
            .map { $0.uppercased() }
        
        print(upperRes) // ["ITALY"]
        
        // ⚡ Декларативный стиль (экспертный уровень)
        
        // Твоя реализация здесь (максимум 1 строка цепочки!)
        let result = euroUnion
            .filter { $0.last == "y" }
            .map { $0.uppercased() }
        print(result) // ["ITALY"]
        
        //
        let res = euroUnion
            .compactMap { $0.hasSuffix("y") ? $0.uppercased() : nil }
        print(res) // ["ITALY"]
        
        // COMMENTS:
        /*  💡 Почему compactMap более декларативный:
         
         1) Одна операция вместо двух (filter + map)
         2) Более выразительно - "преобразуй если условие, иначе пропусти"
         3) Лучшая производительность - один проход по массиву  */
    }
    
    static func task3a_2() {
        print("Задача 3a.2: Создайте масив из 6 значений любого типа. Сделайте линейную сортировку - 'Selection Sort'.")
        
        // option 1: 🐢 'Imperative style'
        var nums = [90, 21, 1, 888, 12, 45] // Создай массив
        print("Исходный массив: \(nums)")
        
        let countNums = nums.count
        
        // 2. Внешний цикл
        for i in 0..<countNums - 1 {
            var minIndex = i // Предполагаем: min элемент - первый в неотсортированной части
            
            // 3. Внутренний цикл (ЛИНЕЙНЫЙ ПРОХОД для поиска минимума)
            for j in i + 1..<countNums {
                if nums[j] < nums[minIndex] {
                    minIndex = j // Обновляем индекс минимального элемента
                }
            }
            
            // 4. После того как нашли min в НЕотсортированной части, меняем его местами с элементом на позиции i
            if minIndex != i {
                nums.swapAt(i, minIndex) // Более Swift-способ обмена элементов
            }
        }
        
        // 6. Вывод результата (вынесен за пределы цикла)
        print("Отсортированный массив: \(nums)") // Отсортированный массив: [1, 12, 21, 45, 90, 888]
    }
    
    /*  Объяснение алгоритма:
     
     - Внешний цикл (for i in 0..<countNums - 1) проходит по всем элементам массива, кроме последнего
     - Внутренний цикл (for j in i+1..<countNums) ищет min элемент в неотсортированной части массива
     - Обмен элементов - меняем местами текущий элемент с найденным min */
    
    // Альтернативный вариант с выводом промежуточных шагов:
    
    static func task3aa_2() {
        print("Задача 3aa.2: Создайте массив из 6 значений любого типа. Сделайте линейную сортировку (linear sort).")
        
        var nums = [90, 21, 1, 888, 12, 45]
        print("Исходный массив: \(nums)")
        
        let countNums = nums.count
        
        for i in 0..<countNums - 1 {
            var minIndex = i
            
            for j in i + 1..<countNums {
                if nums[j] < nums[minIndex] {
                    minIndex = j
                }
            }
            
            if minIndex != i {
                nums.swapAt(i, minIndex)
                print("Шаг \(i + 1): Поменяли \(nums[minIndex]) и \(nums[i]) → \(nums)")   // Вот откуда появляются эти принты!
            }
        }
        
        print("Финальный отсортированный массив: \(nums)")
    }
    /*  Откуда взялись эти принты:
     
     print("Шаг \(i + 1): Поменяли \(oldValueAtI) и \(oldValueAtMinIndex) → \(nums)") - эта строка внутри условия if minIndex != i выводит информацию о каждом обмене элементов
     Как это работает на каждом шаге:
     
     Исходный массив: [90, 21, 1, 888, 12, 45]
     
     Шаг 1: Находим минимальный элемент (1) и меняем его с первым элементом (90)
     Шаг 2: В оставшейся части находим минимальный (12) и меняем со вторым элементом (21)
     Шаг 3: Находим минимальный (21) в оставшейся части и меняем с третьим элементом (90)
     Шаг 4: Находим минимальный (45) и меняем с четвертым элементом (888) */
    
    // Альтернативный вариант с другими типами данных:
    
    static func task3ab_2() {
        print("Задача 3a.2: Создайте массив из 6 значений любого типа. Сделайте линейную сортировку")
        
        // Массив строк
        var strings = ["banana", "apple", "cherry", "limon", "kiwi", "fig"]
        print("Исходный массив строк: \(strings)") // 🥝 → 🍎 → 🍈 → 🍌 → 🍋 → 🍒 Исходный массив строк: ["banana", "apple", "cherry", "limon", "kiwi", "fig"]
        
        let count = strings.count
        
        for i in 0..<count - 1 {
            var minIndex = i
            for j in i+1..<count {
                if strings[j] < strings[minIndex] {
                    minIndex = j
                }
            }
            if minIndex != i {
                strings.swapAt(i, minIndex) // Более Swift-способ обмена элементов
            }
        }
        
        print("Отсортированный массив строк: \(strings)") // Отсортированный массив строк: 🍎🍌🍒🍈🥝🍋 ["apple", "banana", "cherry", "fig", "kiwi", "limon"]
    }
    
    static func task3ac_2() {
        print("Задача 3ac.2: Создайте масив из 12 значений любого типа. Сделайте линейную сортировку 'linear sort' по алфавиту.")
        
        var companyOfThorin = [
            "Thorin Oakenshield",
            "Balin", "Dwalin",
            "Fili", "Kili",
            "Dori", "Nori", "Ori", // Братья!
            "Oin", "Gloin",
            "Bifur", "Bofur", "Bombur",
            "Bilbo Baggins" // Наш любимый хоббит!
        ]
        print("Исходный состав 'Торин и К': \(companyOfThorin)") // Исходный состав 'Торин и К': ["Thorin Oakenshield", "Balin", "Dwalin", "Fili", "Kili", "Dori", "Nori", "Ori", "Oin", "Gloin", "Bifur", "Bofur", "Bombur", "Bilbo Baggins"]
        
        let trevelerCount = companyOfThorin.count
        
        for treveler in 0..<trevelerCount - 1 {
            var minIndex = treveler
            for dwarf in treveler + 1..<trevelerCount {
                if companyOfThorin[dwarf] < companyOfThorin[minIndex] {
                    minIndex = dwarf
                }
            }
            if minIndex != treveler {
                companyOfThorin.swapAt(treveler, minIndex)
            }
        }
        print("Состав 'Торин и К' по алфавиту: \(companyOfThorin).") // Состав 'Торин и К' по алфавиту: ["Dwalin", "Fili", "Kili", "Dori", "Nori", "Ori", "Oin", "Gloin", "Bifur", "Bofur", "Bombur", "Bilbo Baggins", "Balin", "Thorin Oakenshield"]
        
    }
    
    static func task3ad_2() {
        print("Задача 3ad.2: Создайте масив из 12 значений любого типа. Сделайте линейную сортировку 'linear sort' по алфавиту.")
        // ✅ Путь 2: Декларативный (Использование встроенной сортировки)
        
        var companyOfThorin = [
            "Thorin",
            "Balin", "Dwalin",
            "Fili", "Kili",
            "Bilbo Baggins" // Наш любимый хоббит!
        ]
        companyOfThorin.sort() // in-place
        print(companyOfThorin) // ["Balin", "Bilbo Baggins", "Dwalin", "Fili", "Kili", "Thorin"]
        // или
        let sortedArray = companyOfThorin.sorted() // возвращает НОВЫЙ массив
        print(companyOfThorin) // ["Balin", "Bilbo Baggins", "Dwalin", "Fili", "Kili", "Thorin"]
    }
    
    static func task3ae_2() {
        print("Задача 3ae.2: используй сортировку выбором - 'linear sort' - по полю “возраст” и выведи отсортированный список.")
        
        struct Hobbit {
            var name: String
            var age: Int
        }
        var friends = [
            Hobbit(name: "Frodo", age: 60),
            Hobbit(name: "Sam", age: 46),
            Hobbit(name: "Pin", age: 33),
            Hobbit(name: "Merry", age: 36),
            Hobbit(name: "Folko", age: 35)
            
        ]
        print("Исходный массив:")
        friends.forEach { print("\($0.name) — возраст \($0.age)") }
        
        /*   Исходный массив:
         Frodo — возраст 60
         Sam — возраст 46
         Pin — возраст 33
         Merry — возраст 36
         Folko — возраст 35  */
        
        for friend in 0..<friends.count - 1 {
            var minIndex = friend // предположу, что min элемент - 1-ый в массиве
            
            for hobbit in friend + 1..<friends.count {
                if friends[hobbit].age < friends[minIndex].age {
                    minIndex = hobbit
                }
            }
            if minIndex != friend {
                friends.swapAt(friend, minIndex)
            }
        }
        print("Отсортированный по возрасту массив хоббитов:")
        friends.forEach { print("\($0.name) — возраст \($0.age)") }
    }
    /*  Отсортированный по возрасту массив хоббитов:
     Pin — возраст 33
     Folko — возраст 35
     Merry — возраст 36
     Sam — возраст 46
     Frodo — возраст 60  */
    
    // Swift-стиль с встроенной сортировкой (рекомендуется для production)
    
    static func task3a_2_swiftStyle() {
        print("Задача 3ae.2: сортировка по возрасту - Swift-стиль с встроенной сортировкой (рекомендуется для production)")
        
        struct Hobbit {
            let name: String
            let age: Int
        }
        
        var friends = [
            Hobbit(name: "Frodo", age: 60),
            Hobbit(name: "Sam", age: 46),
            Hobbit(name: "Pin", age: 33),
            Hobbit(name: "Merry", age: 36),
            Hobbit(name: "Folko", age: 35)
        ]
        
        print("Исходный массив:")
        friends.forEach { print("\($0.name) — возраст \($0.age)") }
        
        // Swift-стиль сортировки - одна строка!
        friends.sort { $0.age < $1.age }
        
        print("\nОтсортированный по возрасту массив:")
        friends.forEach { print("\($0.name) — возраст \($0.age)") }
    }
    /*  Отсортированный по возрасту массив:
     Pin — возраст 33
     Folko — возраст 35
     Merry — возраст 36
     Sam — возраст 46
     Frodo — возраст 60  */
    
    
    // Функциональный стиль с созданием нового массива
    
    static func task3a_2_functional() {
        print("Задача 3ag.2: функциональный стиль")
        
        struct Wizard {
            let name: String
            let age: Int
        }
        
        let wizards = [
            Wizard(name: "Gandalf the Gray", age: 2050),
            Wizard(name: "Saruman the White", age: 2222),
            Wizard(name: "Radagast the Broun", age: 2021)
        ]
        
        print("Исходный массив:")
        wizards.forEach { print("\($0.name) — возраст \($0.age)") }
        
        // Функциональный подход - создает новый отсортированный массив
        let sortedWizards = wizards.sorted { $0.age < $1.age }
        
        print("\nОтсортированный по возрасту массив 🧙‍♂️:")
        sortedWizards.forEach { print("\($0.name) — возраст \($0.age)") }
    }
    /*  Отсортированный по возрасту массив 🧙‍♂️:
     Radagast the Broun — возраст 2021
     Gandalf the Gray — возраст 2050
     Saruman the White — возраст 2222    */
    
    // Улучшенная версия вашего алгоритма с комментариями
    static func task3a_2_perfect() {
        print("Задача 3ah.2: улучшенная сортировка выбором - 'linear sort'.")
        
        struct Human {
            let name: String
            let age: Int
        }
        
        var humansOfRohan = [
            Human(name: "Teoden", age: 72),
            Human(name: "Eomer", age: 33),
            Human(name: "Éowyn", age: 24),
            Human(name: "Théodred", age: 27),
            Human(name: "Gríma Wormtongue", age: 38)
        ]
        
        print("Исходный массив:")
        humansOfRohan.enumerated().forEach { index, human in
            print("\(index + 1). \(human.name) — \(human.age) лет")
        }
        
        // Сортировка выбором с подробными комментариями
        for currentIndex in 0..<humansOfRohan.count - 1 {
            var minIndex = currentIndex
            
            // Поиск минимального элемента в оставшейся части
            for searchIndex in (currentIndex + 1)..<humansOfRohan.count {
                if humansOfRohan[searchIndex].age < humansOfRohan[minIndex].age {
                    minIndex = searchIndex
                }
            }
            
            // Обмен местами, если нашли меньший элемент
            if minIndex != currentIndex {
                humansOfRohan.swapAt(currentIndex, minIndex)
            }
        }
        
        print("\nОтсортированный по возрасту массив людей Рохана:")
        humansOfRohan.enumerated().forEach { index, human in
            print("\(index + 1). \(human.name) — \(human.age) лет")
        }
    }
    /*  Отсортированный по возрасту массив людей Рохана:
     1. Éowyn — 24 лет
     2. Théodred — 27 лет
     3. Eomer — 33 лет
     4. Gríma Wormtongue — 38 лет
     5. Teoden — 72 лет */
    
    // 4. Самый компактный вариант
    
    static func task3a_2_compact() {
        struct Human { let name: String; let age: Int }
        
        var gondors = [
            Human(name: "Aragorn", age: 333),
            Human(name: "Boromir", age: 36),
            Human(name: "Faramir", age: 32),
            Human(name: "Denethor", age: 88),
            Human(name: "Beregond", age: 28)
        ]
        
        print("Исходный массив гондорцев:"); gondors.forEach { print("\($0.name) - \($0.age)") }
        gondors.sort(by: { $0.age < $1.age })
        print("Отсортированный массив гондорцев:"); gondors.forEach { print("\($0.name) - \($0.age)") }
    }
    /*   Исходный массив гондорцев:
     Aragorn - 333
     Boromir - 36
     Faramir - 32
     Denethor - 88
     Beregond - 28
     
     Отсортированный массив гондорцев:
     Beregond - 28
     Faramir - 32
     Boromir - 36
     Denethor - 88
     Aragorn - 333   */
    
    static func task3a_3() {
        print("Задача 3a.3: .Найди все анаграммы в массиве слов и сгруппируй слова-анаграммы вместе.")
        
        
        let words = ["cat", "act", "dog", "god", "tac", "hello", "world", "listen", "silent"]
        
        var groups: [String: [String]] = [:]
        
        for word in words {
            let key = String(word.sorted())
            if groups[key] == nil {
                groups[key] = [word]
            } else {
                groups[key]!.append(word)
            }
        }
        
        let result = Array(groups.values)
        print(result) // [["listen", "silent"], ["world"], ["dog", "god"], ["hello"], ["cat", "act", "tac"]]
    }
    
    
    static func task3a_4() {
        print("Задача 3a.4: Создайте масив из 6 значений любого типа. Сделайте линейную сортировку (linear sort.")
        
        
        
    }
    static func task3a_5() {
        print("Задача 3a.5: Создайте масив из 6 значений любого типа. Сделайте линейную сортировку (linear sort.")
        
    }
    static func task3a_6() {
        print("Задача 3a.6: Создайте масив из 6 значений любого типа. Сделайте линейную сортировку (linear sort.")
        
    }
    
    static func task3a_7() { // Объявление статической функции без параметров и возвращаемого значения
        print("Задача 3a.2: Группировка по ключу (хоббитов по 'race').") // Вывод в консоль названия задачи. Ожидаемый результат - "Hobbit": ["Frodo", "Sam"], "Wizard": ["Gandalf"], "Elf": ["Legolas"].")
        
        struct Character { // Объявление структуры Character с двумя свойствами
            let name: String    // Имя персонажа
            let race: String    // Раса персонажа
        }
        
        let characters = [  // Создание массива экземпляров структуры Character
            Character(name: "Frodo", race: "Hobbit"),
            Character(name: "Gandalf", race: "Wizard"),
            Character(name: "Legolas", race: "Elf"),
            Character(name: "Sam", race: "Hobbit")
        ]
        
        // 🔁 Единый алгоритм для всех задач:
        // 1. Создаем пустой СЛОВАРЬ для ГРУПП - ключ: раса, значение: массив ИМЕН
        var races: [String: [String]] = [:]
        
        // 2. Проходим по ВСЕМ элементам массива characters
        for character in characters {
            // 3. Вычисляем КЛЮЧ для текущего элемента (раса персонажа)
            let key = character.race // зависит от задачи
            
            // 4. Добавляем элемент в группу с этим ключом
            if races[key] == nil {
                races[key] = [character.name] // Если группы с такой расой еще нет - создаем НОВУЮ
            } else {
                races[key]!.append(character.name)  // Если группа уже существует - добавляем имя в существующий массив
            }
        }
        
        print("Группируем по race:") // Выводим результат группировки в консоль
        
        for (race, names) in races { // Проходим по всем парам ключ-значение в словаре races
            // Выводим расу и список имен через запятую
            print("\(race): \(names.joined(separator: ", "))")
            /* Ожидаемый вывод:
             Elf: Legolas
             Wizard: Gandalf
             Hobbit: Frodo, Sam     */
        }
    }
    static func task3ab_7() {
        print("Задача 3a.7: 📝 Сгруппируй персонажей по первой букве имени.")
        
        struct Character {
            let name: String
            let race: String
        }
        
        let characters = [
            Character(name: "Frodo", race: "Hobbit"),
            Character(name: "Gandalf", race: "Wizard"),
            Character(name: "Legolas", race: "Elf"),
            Character(name: "Sam", race: "Hobbit"),
            Character(name: "Aragorn", race: "Human") // Добавим для примера
        ]
        
        var charDict: [String: [String]] = [:]
        for char in characters {
            let firstLetter = String(char.name.first ?? " ")
            charDict[firstLetter] = (charDict[firstLetter] ?? []) + [char.name]
        }
        
        // Выводим результат
        print("Результат группировки:")
        for (key, values) in charDict.sorted(by: { $0.key < $1.key }) {
            print("\(key): \(values.joined(separator: ", "))")
        }
    }
    
    // Функция для красивого вывода (отдельно)
    func printBeautifully(charDict: [String: [String]]) {
        for (key, values) in charDict.sorted(by: { $0.key < $1.key }) {
            print("\(key): \(values.joined(separator: ", "))")
        }
    } /* Результат группировки:
       A: Aragorn
       F: Frodo
       G: Gandalf
       L: Legolas
       S: Sam   */
    
    static func task3aс_7() {
        print("Задача 3ac.7: 📝 Сгруппируй персонажей по длине имени / расы. Суть: от массива структур - к словарю чисел и строк.")
        
        struct Character {
            let name: String
            let race: String
        }
        
        let characters = [
            Character(name: "Frodo", race: "Hobbit"),
            Character(name: "Gandalf", race: "Wizard"),
            Character(name: "Legolas", race: "Elf"),
            Character(name: "Sam", race: "Hobbit"),
            Character(name: "Aragorn", race: "Human")
        ]
        
        var emptyDict: [Int: [String]] = [:] // пустой словарь для групп
        
        for char in characters { // циклом пройди по всему массиву структур
            let countName = char.name.count // не нужно проверять на nil
            
            emptyDict[countName] = (emptyDict[countName] ?? []) + [char.name]
        }
        // Выводим результат
        print("Итак:")
        for (key, values) in emptyDict.sorted(by: { $0.key < $1.key }) {
            print("\(key): \(values.joined(separator: ", "))")
        }
    }
    
    // Функция для красивого вывода (отдельно)
    func printBeauty(emptyDict: [String: [String]]) {
        for (key, values) in emptyDict.sorted(by: { $0.key < $1.key }) {
            print("\(key): \(values.joined(separator: ", "))")
        }
    } /* Суть: от массива структур - к словарю строк.
       Итак:
       3: Sam
       5: Frodo
       7: Gandalf, Legolas, Aragorn */
    
    static func task3ad_7() {
        print("Задача 3ad.7: 📝 Сгруппируй персонажей по длине расы. Nil-coalescing. Суть: от массива структур - к словарю чисел и строк.")
        
        struct Character {
            let name: String
            let race: String
        }
        
        let characters = [
            Character(name: "Frodo", race: "Hobbit"),
            Character(name: "Gandalf", race: "Wizard"),
            Character(name: "Legolas", race: "Elf"),
            Character(name: "Sam", race: "Hobbit"),
            Character(name: "Aragorn", race: "Human")
        ]
        var emptyDict: [Int: [String]] = [:]
        
        for char in characters {
            let raceCount = char.race.count
            emptyDict[raceCount] = (emptyDict[raceCount] ?? []) + [char.race]
        }
        print("Result:")
        for (key, values) in emptyDict.sorted(by: { $0.key < $1.key }) {
            print("\(key): \(values.joined(separator: ", "))")
        }
    } /* Result:
       3: Elf
       5: Human
       6: Hobbit, Wizard, Hobbit */
    
    static func task3ae_7() {
        print("Задача 3ae.7: 📝 Сгруппируй персонажей по длине расы. Цикл for-in. Суть: от массива структур - к словарю чисел и строк.")
        
        struct Character {
            let name: String
            let race: String
        }
        
        let characters = [
            Character(name: "Frodo", race: "Hobbit"),
            Character(name: "Gandalf", race: "Wizard"),
            Character(name: "Legolas", race: "Elf"),
            Character(name: "Sam", race: "Hobbit"),
            Character(name: "Aragorn", race: "Human")
        ]
        var emptyDict: [Int: [String]] = [:]
        
        for char in characters {
            let raceCount = char.race.count
            // 4. Добавляем элемент в группу с этим ключом
            if emptyDict[raceCount] == nil {
                emptyDict[raceCount] = [char.race] // Если группы с такой расой еще нет - создаем НОВУЮ
            } else {
                emptyDict[raceCount]!.append(char.race)  // Если группа уже существует - добавляем имя в существующий массив
            }
        }
        print("РеЗуЛьТаТ:")
        for (key, values) in emptyDict.sorted(by: { $0.key < $1.key }) {
            print("\(key): \(values.joined(separator: ", "))")
    }
} /*    РеЗуЛьТаТ:
        3: Elf
        5: Human
        6: Hobbit, Wizard, Hobbit */

static func task3af_7() {
    print("Задача 3ae.7: 📝 Сгруппируй персонажей по длине расы. Функциональный стиль. Суть: от массива структур - к словарю чисел и строк.")
    
    struct Character {
        let name: String
        let race: String
    }
    
    let characters = [
        Character(name: "Frodo", race: "Hobbit"),
        Character(name: "Gandalf", race: "Wizard"),
        Character(name: "Legolas", race: "Elf"),
        Character(name: "Sam", race: "Hobbit"),
        Character(name: "Aragorn", race: "Human")
    ]
    
    let grouped = characters.reduce(into: [Int: [String]]()) { resultDict, char in
        let key = char.race.count
        resultDict[key, default: []].append(char.race)
    }
    print("Result:")
    for (key, values) in grouped.sorted(by: { $0.key < $1.key }) {
        print("\(key): \(values.joined(separator: ", "))")
        } // 💡 reduce(into:) — это как "аккумулятор"
    // array.reduce(into: начальное_значение) { результат, элемент in
        // изменяем результат
    }
} /*    Result:
            3: Elf
            5: Human
            6: Hobbit, Wizard, Hobbit   */


