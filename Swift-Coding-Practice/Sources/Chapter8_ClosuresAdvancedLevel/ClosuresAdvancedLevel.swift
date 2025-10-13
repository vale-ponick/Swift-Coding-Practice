//
//  ClosuresAdvancedLevel.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 04.10.2025.
//

import Foundation

public struct Chapter8_ClosuresAdvancedLevel {  // ← измени здесь имя
    public static func runAllTasks() {
        print("=== Глава 8: Замыкания. Продвинутый уровень ===")
        
        task8a_1()
        task8a_2()
        task8a_3()
        task8a_4()
        task8a_5()
        task8a_6()
    }
    
    static func task8a_1() {
        print("Задача 8a.1:  Создай функцию, которая принимает массив Double. Напиши алгоритм, который находит в массиве min значение. Распечатай результат на консоль.")
        
        func findMin(nums: [Double]) -> Double {
            nums.min() ?? 0
        }
        print(findMin(nums: [3.14, 2.22, 0.01, 12.12, 21.21])) // 0.01
    }
    
    static func task8a_2() {
        print("Задача 8a.2: Теперь в этом же массиве найди max значение. Распечатай результат в консоль.")
        
        //MARK: оператор nil-coalescing (оператор объединения по nil)
        func findMax(nums: [Double]) -> Double {
            nums.max() ?? 0
        }
        print(findMax(nums: [3.14, 2.22, 0.01, 12.12, 21.21])) // 21.21
    }
    static func task8a_3() {
        print("Задача 8a.3: Создай функцию, которая принимает массив букв (Chars). Отсортируй массив так, чтобы гласные оказались в левой части, а согласные - в правой. Раздели массив на гласные и согласные (два отдельных массива). Отсортируй каждый по алфавиту. Сложите 2 массива в 1. Распечатай результат на консоль.")
        
        func sortedVowelsAndConsonants(chars: [Character]) {
            let vowels = Set("aeiouAEIOU") //
            let letters = chars.filter { $0.isLetter }
            
            let vowelsArray = letters.filter { vowels.contains($0) }
            let consonantsArray = letters.filter { !vowels.contains($0) }
            let sortedVowels = vowelsArray.sorted { $0.uppercased() < $1.uppercased() }
            let sortedConsonants = consonantsArray.sorted { $0.uppercased() < $1.uppercased() }
            let result = sortedVowels + sortedConsonants
            
            print("Исходный массив: \(chars)")
            print("Буквы (после фильтрации): \(letters)")
            print("Гласные: \(sortedVowels)")
            print("Согласные: \(sortedConsonants)")
            print("Результат: \(result)")
        }
        sortedVowelsAndConsonants(chars: ["b", "b", "b", "c", "i", "B", "%", "&", "e", "z", "U", "A", "a", "E"])
    }
    
    static func task8a_4() {
        print("Задача 8a.4: Создай функцию, которая принимает массив строк и замыкание-предикат. Функция должна возвращать отфильтрованный массив строк, удовлетворяющих условию замыкания. Протестируй на поиске слов длиннее 5 символов и слов, начинающихся с заглавной буквы.")
        
        func filterStrings(_ texts: [String], predicate: (String) -> Bool) -> [String] {
            return texts.filter(predicate) // Встроенный метод filter
        }
        
        // Предикаты (условия фильтрации)
        let longWordPredicate: (String) -> Bool = { word in
            return word.count > 5
        }
        
        let capitalizedPredicate: (String) -> Bool = { word in
            return word.first?.isUppercase == true
        }
        
        // Тестирование
        let words = ["sam", "tom", "Sammium", "jerry", "Peregrin"]
        
        let longWords = filterStrings(words, predicate: longWordPredicate)
        let capitalizedWords = filterStrings(words, predicate: capitalizedPredicate)
        
        print("Исходный массив: \(words)") // Исходный массив: ["sam", "tom", "Sammium", "jerry", "Peregrin"]
        print("Слова длиннее 5 символов: \(longWords)") // Слова длиннее 5 символов: ["Sammium", "Peregrin"]
        print("Слова с заглавной буквы: \(capitalizedWords)") // Слова с заглавной буквы: ["Sammium", "Peregrin"]
    }
    
    static func task8a_5() {
        print("Задача 8a.5: Сортировка по нескольким критериям. Создай функцию, которая принимает массив товаров (название, цена, рейтинг) и массив замыканий-компараторов. Функция должна отсортировать массив последовательно применяя все компараторы. Протестируй на сортировке: сначала по рейтингу (убывание), потом по цене (возрастание).")
        
        struct Product {
            let name: String
            let color: String
            let memory: Int
            let price: Double
            let rating: Double
        }
        
        let products = [
            Product(name: "iPhone 17", color: "Gray", memory: 256, price: 110.0, rating: 4.2),
            Product(name: "iPhone Air", color: "Gray", memory: 256, price: 144.0, rating: 3.5),
            Product(name: "iPhone 17 Pro", color: "Orange", memory: 512, price: 140.0, rating: 4.5),
            Product(name: "iPnone Pro Max", color: "Black", memory: 256, price: 184.0, rating: 3.3)
        ]
        
        // 1. Функция сортировки
        func sortedArrayByComparators(products: [Product], comparators: [(Product, Product) -> Bool]) -> [Product] {
            var sortedProducts = products
            for comparator in comparators {
                sortedProducts.sort(by: comparator)
            }
            return sortedProducts
        }
        
        // 2. Компараторы (ПОСЛЕ функции)
        let ratingComparator: (Product, Product) -> Bool = { product1, product2 in
            return product1.rating > product2.rating
        }
        let priceComparator: (Product, Product) -> Bool = { product1, product2 in
            return product1.price < product2.price
        }
       
        // Тест: Два компаратора (сначала по рейтингу, потом по цене)
        let result2 = sortedArrayByComparators(products: products, comparators: [ratingComparator, priceComparator])
        print("= По рейтингу (убывание) + по цене (возрастание) =")
        for product in result2 {
            print("\(product.name) - ★\(product.rating) - $\(product.price)")
        }
    }
    
    /* = По рейтингу (убывание) + по цене (возрастание) =
     iPhone 17 - ★4.2 - $110.0
     iPhone 17 Pro - ★4.5 - $140.0
     iPhone Air - ★3.5 - $144.0
     iPnone Pro Max - ★3.3 - $184.0 */
    
    static func task8a_6() {
        print("Задача 8a.6: Создай УНИВЕРСАЛЬНУЮ функцию сортировки по нескольким критериям. Создай функцию, которая принимает массив ЛЮБОГО типа данных и массив замыканий-компараторов. Функция должна отсортировать массив последовательно применяя все компараторы. Протестируй на сортировке: сначала по рейтингу (убывание), потом по цене (возрастание).")
        
        // УНИВЕРСАЛЬНАЯ функция для ЛЮБОГО типа
        func sortedArrayByComparators<T>(_ array: [T], comparators: [(T, T) -> Bool]) -> [T] {
            guard !comparators.isEmpty else { return array }
            var sortedArray = array
            for comparator in comparators {
                sortedArray.sort(by: comparator)
            }
            return sortedArray
        }
        
        
        // ТЕСТИРУЕМ на структуре Product
        struct Product {
            let name: String
            let color: String
            let memory: Int
            let price: Double
            let rating: Double
        }
        
        let products = [
            Product(name: "iPhone 17", color: "Gray", memory: 256, price: 110.0, rating: 4.2),
            Product(name: "iPhone Air", color: "Gray", memory: 256, price: 144.0, rating: 3.5),
            Product(name: "iPhone 17 Pro", color: "Orange", memory: 512, price: 140.0, rating: 4.5),
            Product(name: "iPhone Pro Max", color: "Black", memory: 256, price: 184.0, rating: 3.3)
        ]
        
        // Компараторы
        let ratingComparator: (Product, Product) -> Bool = { $0.rating > $1.rating }
        let priceComparator: (Product, Product) -> Bool = { $0.price < $1.price }
        
        // ВЫЗОВ универсальной функции
        let result = sortedArrayByComparators(products, comparators: [ratingComparator, priceComparator])
        
        // ВЫВОД результатов
        print("= Результат универсальной сортировки =")
        for (index, product) in result.enumerated() {
            print("\(index + 1). \(product.name)")
            print("   Рейтинг: 🚀\(product.rating)")
            print("   Цена: $\(product.price)")
            print("   Память: \(product.memory)GB")
            print("   Цвет: \(product.color)")
        }
    }
}
/* = Результат универсальной сортировки =
 1. iPhone 17
    Рейтинг: 🚀4.2
    Цена: $110.0
    Память: 256GB
    Цвет: Gray
 2. iPhone 17 Pro
    Рейтинг: 🚀4.5
    Цена: $140.0
    Память: 512GB
    Цвет: Orange
 3. iPhone Air
    Рейтинг: 🚀3.5
    Цена: $144.0
    Память: 256GB
    Цвет: Gray
 4. iPhone Pro Max
    Рейтинг: 🚀3.3
    Цена: $184.0
    Память: 256GB
    Цвет: Black */

