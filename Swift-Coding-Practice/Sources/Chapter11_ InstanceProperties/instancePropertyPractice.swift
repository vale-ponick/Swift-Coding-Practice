//
//  instancePropertyPractice.swift
//  Swift-Coding-Practice
//
//  Created by Валерия Пономарева on 27.10.2025.
//

import Foundation

public struct Chapter11_InstanceProperty {
    public static func runAllTasks() {
        print("- Глава 11: Свойства экземпляра -")
        
        task11_1()
        task11a_1()
        task11b_1()
        task11c_1()
        task11_2()
        task11_3()
        task11_4()
        task11_5()
        task11_6()
        task11_7()
        task11_8()
    }
    
    static func task11_1() {
        print("Задача 11.1: Создай 10-20 классов с разными свойствами: хранения, вычисляемые (запись и чтение, просто запись, просто чтение), ленивые, обязательно тренируйся с observers (наблюдатели).")
        
        class Article {
            let title: String
            let author: String
            var text: String
            let date: Date
            
            init(title: String, author: String, text: String, date: Date) {
                self.title = title
                self.author = author
                self.text = text
                self.date = date
            }
        }
        var note = Article(title: "Swift classes", author: "Vale", text: "Class - this is named block of the code.", date: Date())
        
        let note1 = "Classes in Swift is a reference type."
        func add(note: Article) -> String {
            return "\(note.text) \(note1)"
        }
        print(add(note: note))
    }
    
    static func task11a_1() {
        print("Задача 11a.1: Создай 10-20 классов с разными свойствами: хранения, вычисляемые (запись и чтение)")
        
        class Post {
            var title: String
            let author: String
            var quote: String
            
            init(title: String, author: String, quote: String) {
                self.title = title
                self.author = author
                self.quote = quote
            }
        }
        
        // Работа со ссылками
        let postHmelevska = Post(
            title: "Что сказал покойник",
            author: "I.Hmelevska",
            quote: "«Результаты сложных арифметических вычислений...»"
        )
        
        print(postHmelevska.title) // Что сказал покойник
        let postIoanna = postHmelevska  // Ссылка на тот же объект
        postIoanna.title = "Все красное"  // 🔥 Меняет и postHmelevska.title!
        
        print(postHmelevska.title) // Все красное 🔥 Изменилось!
        print(postIoanna.title)    // Все красное
        
        struct PostStruct {
            var title: String
            let author: String
            var quote: String
        }
        
        let postStructHmelevska = PostStruct(
            title: "Что сказал покойник",
            author: "I.Hmelevska",
            quote: "«Результаты сложных арифметических вычислений...»"
        )
        
        // 📋 Структура - работа с копиями
        var postStructIoanna = postStructHmelevska  // Сразу создаем копию!
        postStructIoanna.title = "Все красное"
        
        print(postStructHmelevska.title) // "Что сказал покойник" ✅ Оригинал НЕ изменился!
        print(postStructIoanna.title)    // "Все красное"
    }
    
    static func task11b_1() {
        print("Задача 11b.1: Создай 10-20 классов с разными свойствами: хранения, вычисляемые (запись и чтение, просто запись, просто чтение), ленивые, обязательно тренируйся с observers (наблюдатели).")
        
        class Dog {
            private let breed: String
            private let color: String

            var age: Double {
                didSet {
                    if age < oldValue {
                        print("Ошибка! Возраст нельзя уменьшать. Возврат к предыдущему значению \(oldValue)")
                        age = oldValue
                    } else {
                        print("Возраст собаки увеличен до: \(age)")
                    }
                }
            }

            init(breed: String, color: String, age: Double) {
                self.breed = breed
                self.color = color
                self.age = age
            }

            func getBreed() -> String {
                breed
            }

            func getColor() -> String {
                color
            }
           
            func bark() {
                print("Woof!")
            }

            func getInfo() -> String {
                return "\(breed), \(color), \(age) years"
            }
        }
            
        // ✅ ЭКЗЕМПЛЯРЫ создаются ВНЕ класса
        let shanya = Dog(breed: "Caucasian Shepherd Dog", color: "blac and red", age: 8.6)
        let rex = Dog(breed: "Husky", color: "white and gray", age: 0.3)
        
        // Использование экземпляров:
        print("Текущий возраст: \(shanya.age)")  // 8.6
        shanya.age = 10.0  // ✅ Успешно - увеличиваем
        shanya.age = 9.0
        print(rex.getInfo())
    }
    /* Текущий возраст: 8.6
     Возраст собаки увеличен до: 10.0
     Ошибка! Возраст нельзя уменьшать. Возврат к предыдущему значению 10.0
     Husky, white and gray, 0.3 years
     
     🎯 Что отлично в коде:
     ✅ Публичное свойство age с валидацией

     ✅ Приватные breed и color только для чтения

     ✅ Корректная логика в didSet

     ✅ Чистые геттеры для приватных свойств

     ✅ Правильная структура класса*/
    
    static func task11c_1() {
        print("Задача 11c.1: Создай 10-20 классов с разными свойствами: хранения, вычисляемые (запись и чтение, просто запись, просто чтение), ленивые, обязательно тренируйся с observers (наблюдатели).")
    }
    
    static func task11_2() {
        print("Задача 11.2: Напиши класс Калькулятор. Создай вычисляемые свойства, которые складывают, умножают, делят и вычитают. Выведите результаты в консоль (распечатай).")
    }
    static func task11_3() {
        print("Задача 11.3: Создай свой AppStore! Чтобы можно было записывать и сохранять, а потом вызывать новые приложения в каждой категории. Результаты - в консоль.")
    }
    static func task11_4() {
        print("Задача 11.4: Добавь своему AppStore отзывы. К каждому приложению.В виде текстовых сообщений.")
    }
    static func task11_5() {
        print("Задача 11.5: Добавь возможность поставить оценку приложению. Не более 5 баллов. Если кто-то попытается поставить 6 и выше - какое-то сообщение.")
    }
    static func task11_6() {
        print("Задача 11.6: Подумай, как можно добавить возможность удаления приложений из своего AppStore. Напиши в коде.")
    }
    static func task11_7() {
        print("Задача 11.7: Напиши 12 разных функций, простых и вложенных.")
    }
    static func task11_8() {
        print("Задача 11.8: Напиши 12 сортировок массивов / словарей, с замыканиями и без.")
    }
}
