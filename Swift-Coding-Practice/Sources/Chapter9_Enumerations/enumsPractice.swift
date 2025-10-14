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
        task9_2h()
        task9_2i()
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
        print("Задача 9.2a: Создай enum для дней недели и функцию, которая определяет, является ли день выходным?")
        
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
        print("Задача 9.2b: Создай enum для основных цветов и функцию, которая возвращает HEX-код для каждого цвета")
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
        print("Задача 9.2c: Создай enum для статусов заказа и функцию, которая возвращает описание для каждого статуса")
        
        enum OrderStatus {
            case created
            case paid
            case shipped
            case delivered
            case cancelled
        }
        
        func getStatusDescription(status: OrderStatus) -> String {
            switch status { // для каждого case возвращаем описание
            case .created:
                return "Заказ создан"
            case .paid:
                return "Заказ оплачен"
            case .shipped:
                return "Заказ отправлен"
            case .delivered:
                return "Заказ доставлен"
            case .cancelled:
                return "Заказ отменен"
            }
        }
        
        // 1. Добавляем функции с логикой
        func canCancelOrder(status: OrderStatus) -> Bool {
            switch status {
            case .created, .paid: return true
            case .shipped, .delivered, .cancelled: return false
            }
        }
        
        func getNextStatus(current: OrderStatus) -> OrderStatus? {
            switch current {
            case .created: return .paid
            case .paid: return .shipped
            case .shipped: return .delivered
            default: return nil
            }
        }
        // 2. Тестируем ВСЕ статусы с новой логикой
        
        // протестируем все статусы
        let allStatuses: [OrderStatus] = [.created, .paid, .shipped, .delivered]
        
        // Более красивый вывод статусов
        func getStatusEmoji(status: OrderStatus) -> String {
            switch status {
            case .created: return "📝"
            case .paid: return "💳"
            case .shipped: return "🚚"
            case .delivered: return "📦"
            case .cancelled: return "❌"
            }
        }
        
        for status in allStatuses {
            let emoji = getStatusEmoji(status: status)
            let cancelIcon = canCancelOrder(status: status) ? "✅" : "❌"
            
            print("\(emoji) \(getStatusDescription(status: status))")
            print("   Отмена: \(cancelIcon)")
            
            if let next = getNextStatus(current: status) {
                print("   ➡️ Следующий: \(getStatusDescription(status: next))")
            }
            print()
        }
        /*  📝 Заказ создан
         Отмена: ✅
         ➡️ Следующий: Заказ оплачен
         
         💳 Заказ оплачен
         Отмена: ✅
         ➡️ Следующий: Заказ отправлен
         
         🚚 Заказ отправлен
         Отмена: ❌
         ➡️ Следующий: Заказ доставлен
         
         📦 Заказ доставлен
         Отмена: ❌   */
    }
    
    static func task9_2d() {
        print("Задача 9.2d.d: Создай enum для статусов задачи 'To-DO' и функции для работы с ними.")
        
        enum TaskStatus {
            case new
            case inProgress
            case paused
            case completed
            case cancelled
        }
        
        func getTaskDescription(status: TaskStatus) -> String {
            switch status { // для каждого case возвращаем описание
            case .new: return "Новая задача"
            case .inProgress: return "Задача в работе"
            case .paused: return "Задача на паузе"
            case .completed: return "Задача завершена"
            case .cancelled: return "Задача отменена"
            }
        }
        // 1. Добавляем функции с логикой
        func canEditTask(status: TaskStatus) -> Bool {
            switch status {
            case .new, .inProgress, .paused: return true
            case .completed, .cancelled: return false
            }
        }
        
        func getNextPossibleStatus(current: TaskStatus) -> [TaskStatus] {
            switch current {
            case .new: return [.inProgress, .cancelled]
            case .inProgress: return [.cancelled, .completed, .paused]
            case .paused: return [.inProgress, .cancelled]
            case .completed: return []
            case .cancelled: return []
            }
        }
        //  Протестировать ВСЕ статусы
        let allStatuses: [TaskStatus] = [.new, .inProgress, .paused, .completed, .cancelled]
        
        for status in allStatuses {
            print("Статус: \(getTaskDescription(status: status))")
            print("Можно редактировать: \(canEditTask(status: status))")
            
            // ПЕРЕНЕСИ ЭТОТ КОД СЮДА, ВНУТРЬ ЦИКЛА:
            let nextStatuses = getNextPossibleStatus(current: status)
            if nextStatuses.isEmpty {
                print("Следующие возможные статусы: нет")
            } else {
                let statusNames = nextStatuses.map { getTaskDescription(status: $0) }
                print("Следующие возможные статусы: \(statusNames.joined(separator: ", "))")
            }
            print("---")
        }
        /*  Задача 9.2d.d: Создай enum для статусов задачи 'To-DO' и функции для работы с ними.
         Статус: Новая задача
         Можно редактировать: true
         Следующие возможные статусы: Задача в работе, Задача отменена
         ---
         Статус: Задача в работе
         Можно редактировать: true
         Следующие возможные статусы: Задача отменена, Задача завершена, Задача на паузе
         ---
         Статус: Задача на паузе
         Можно редактировать: true
         Следующие возможные статусы: Задача в работе, Задача отменена
         ---
         Статус: Задача завершена
         Можно редактировать: false
         Следующие возможные статусы: нет
         ---
         Статус: Задача отменена
         Можно редактировать: false
         Следующие возможные статусы: нет   */
    }
    
    static func task9_2e() {
        print("Задача 9.2.e: Техническое задание: система управления доступом. Цель: реализовать систему проверки прав доступа для разных ролей пользователей.")
        
        // Исходные данные - три enums
        enum UserRole {
            case guest // гость (незарегистрированный юзер)
            case user // обычный зарегистрированный юзер
            case editor // редактор (может редатировать контент)
            case moderator // модератор (может удалять чужой контент)
            case admin // админ (полные права)
        }
        
        enum ResourceType {
            case profile // профиль юзера
            case article // статья / публикация
            case comment // комментарий
            case settings // настройки системы
            case userData // данные других пользователей
        }
        
        enum Permission { // Доступ?
            case none // нет доступа вообще
            case view // может просматривать
            case create // может создать новый
            case edit // может редактировать существующий
            case delete // может удалять
            case manage // полное управление (включая права других)
        }
        // задача 1: базовая проверка прав. Реализуй функцию
        func canAccess(role: UserRole, resource: ResourceType, permission: Permission) -> Bool {
            switch role {
            case .guest:
                switch resource {
                case .article, .comment: return permission == .view
                default:
                    return false
                }
            case .user:
                switch resource {
                case .article, .settings, .userData:
                    return permission == .view
                case .comment:
                    return permission == .view || permission == .create
                case .profile:
                    return permission == .view || permission == .edit
                default:
                    return false
                }
            case .editor:
                switch resource {
                case .article:
                    return permission == .view || permission == .create || permission == .edit
                case .comment, .profile, .settings, .userData:
                    return permission == .view
                default:
                    return false
                }
            case .moderator:
                switch resource {
                case .article, .comment:
                    return permission != .none && permission != .manage
                case .profile, .settings, .userData:
                    return permission == .view
                default:
                    return false
                }
            case .admin:
                return true
            }
        }
        /// ТЕСТИРОВАНИЕ с выводом в консоль
        print("\n🧪 ТЕСТЫ СИСТЕМЫ ПРАВ ДОСТУПА:")
        
        // Тест 1: Должно вернуть true
        let test1 = canAccess(role: .user, resource: .profile, permission: .edit)
        print("✅ Юзер может редактировать профиль: \(test1)")
        
        let test2 = canAccess(role: .moderator, resource: .article, permission: .delete)
        print("✅ Модератор может удалять статьи: \(test2)")
        
        // Тест 2: Должно вернуть false
        let test3 = canAccess(role: .guest, resource: .settings, permission: .view)
        print("❌ Гость не может смотреть настройки: \(test3)")
        
        let test4 = canAccess(role: .user, resource: .userData, permission: .edit)
        print("❌ Юзер не может редактировать чужие данные: \(test4)")
        
        // Дополнительные тесты
        let test5 = canAccess(role: .admin, resource: .settings, permission: .manage)
        print("👑 Админ может управлять настройками: \(test5)")
        
        let test6 = canAccess(role: .editor, resource: .article, permission: .create)
        print("✏️ Редактор может создавать статьи: \(test6)")
    }
    /* 🧪 ТЕСТЫ СИСТЕМЫ ПРАВ ДОСТУПА:
     ✅ Юзер может редактировать профиль: true
     ✅ Модератор может удалять статьи: true
     ❌ Гость не может смотреть настройки: false
     ❌ Юзер не может редактировать чужие данные: false
     👑 Админ может управлять настройками: true
     ✏️ Редактор может создавать статьи: true  */
    
    /*   Просто запомни ЧЕТЫРЕ шага:
     1. Enum для "кто" (роли/статусы)
     2. Enum для "что" (ресурсы/объекты)
     3. Enum для "действие" (права/операции)
     4. Функция с switch(кто) → switch(что)
     
     // Это мой путь:
     Сегодня: "Поняла с подсказками"
     Завтра: "Напишу похожее с парой ошибок"
     Послезавтра: "Создам свою систему с нуля"  */
    
    static func task9_2f() {
        print("Задача 9.2.f: Задача 1: Стриминг платформа. Реализовать систему доступа к контенту по подписке")
        
        
        enum Subscription { case free, premium, pro }
        enum Content { case movie, series, exclusive }
        enum Action { case watch, download, earlyAccess }
        
        // Реализуй функцию:
        func canAccess(subscription: Subscription, content: Content, action: Action) -> Bool
        
        // Правила:
        // FREE:    movies/series → watch
        // PREMIUM: movies/series → watch/download; exclusive → watch
        // PRO:     всё контенты → все действия")
    }
    
    static func task9_2g() {
        print("Задача 9.2.g: Задача 2: Образовательная платформа. Определить права для разных типов аккаунтов")
        
        enum Plan { case trial, student, teacher, school }
        enum Material { case lesson, quiz, exam, certificate }
        enum Operation { case view, attempt, create, grade }
        
        // Реализуй:
        func canPerform(plan: Plan, material: Material, operation: Operation) -> Bool
        
        // Правила:
        // TRIAL:   lessons → view
        // STUDENT: lessons/quizzes/exams → view/attempt; certificates → view
        // TEACHER: всё материалы → view/create/grade
        // SCHOOL:  все операции со всеми материалами")
    }
    
    static func task9_2h() {
        print("Задача 9.3: Задача 3: Фитнес-приложение. Настроить доступ к функциям по типам членства")
        
        enum Membership { case basic, plus, coach, admin }
        enum Workout { case basic, premium, custom, nutrition }
        enum Activity { case view, start, customize, share }
        
        // Реализуй:
        func canDo(membership: Membership, workout: Workout, activity: Activity) -> Bool
        
        // Правила:
        // BASIC:  basic workouts → view
        // PLUS:   basic/premium → view/start
        // COACH:  basic/premium/custom → view/start/customize/share
        // ADMIN:  все workouts → все activities")
    }
    
    static func task9_2i() {
        print("Задача 9.4: Интернет-магазин. Разграничить права пользователей в магазине")
        
        enum UserType { case guest, buyer, seller, manager }
        enum Section { case catalog, cart, orders, analytics }
        enum Access { case view, add, modify, delete }
        
        // Реализуй:
        func hasAccess(user: UserType, section: Section, access: Access) -> Bool
        
        // Правила:
        // GUEST:  catalog → view
        // BUYER:  catalog/cart/orders → view/add (в cart); orders → view
        // SELLER: catalog/orders → view/add/modify; analytics → view
        // MANAGER: все sections → все access")
    }
    
    static func task9_2j() {
        print("Задача 9.5: Электронная библиотека. Ограничить доступ к книгам по возрасту и статусу")
        
        
        enum ReaderLevel { case child, teen, adult, scholar }
        enum BookType { case children, fiction, academic, restricted }
        enum Reading { case preview, borrow, download, annotate }
        
        // Реализуй:
        func canRead(level: ReaderLevel, book: BookType, reading: Reading) -> Bool
        
        // Правила:
        // CHILD:   children → preview/borrow
        // TEEN:    children/fiction → preview/borrow/download
        // ADULT:   children/fiction/academic → все чтения
        // SCHOLAR: все book types → все reading types
    }
    
    static func task9_3() {
        print("Задача 9.3: ..")
        
    }
    static func task9_4() {
        print("Задача 9.3: ..")
    }
}

