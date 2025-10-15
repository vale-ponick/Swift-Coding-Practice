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
        task9_2h()
        task9_2j()
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
        
        enum Subscription { // подписка
            case free // нет подписки
            case premium // премиум
            case pro // продвинутая
        }
        
        enum Content { // контент
            case movie // фильмыб видео
            case series // сериалы
            case exclusive // эксклюзив
        }
        
        enum Action {
            case watch // смотреть
            case download // скачать
            case earlyAccess // ранний доступ
        }
        
        // Реализуй функцию:
        func canAccess(subscription: Subscription, content: Content, action: Action) -> Bool {
            switch subscription {
            case .free:
                switch content {
                case .movie, .series: return action == .watch
                case .exclusive:
                    return false
                }
            case .premium:
                switch content {
                case .movie, .series: return action == .watch || action == .download
                case .exclusive: return action == .watch
                }
            case .pro:
                return true
            }
        }
        print("🧪 ТЕСТЫ СИСТЕМЫ ДОСТУПА:")
        print("❌ Бесплатный: Эксклюзив + Ранний доступ: \(canAccess(subscription: .free, content: .exclusive, action: .earlyAccess))")
        print("✅ Бесплатный: Фильм + Смотреть: \(canAccess(subscription: .free, content: .movie, action: .watch))")
        print("❌ Бесплатный: Фильм + Скачать: \(canAccess(subscription: .free, content: .movie, action: .download))")
        print("❌ Премиум: Эксклюзив + Скачать: \(canAccess(subscription: .premium, content: .exclusive, action: .download))")
        print("✅ Премиум: Сериал + Скачать: \(canAccess(subscription: .premium, content: .series, action: .download))")
        print("✅ Pro: Эксклюзив + Ранний доступ: \(canAccess(subscription: .pro, content: .exclusive, action: .earlyAccess))")
        print("✅ Pro: Фильм + Скачать: \(canAccess(subscription: .pro, content: .movie, action: .download))")
    }
    /* 🧪 ТЕСТЫ СИСТЕМЫ ДОСТУПА:
     ❌ Бесплатный: Эксклюзив + Ранний доступ: false
     ✅ Бесплатный: Фильм + Смотреть: true
     ❌ Бесплатный: Фильм + Скачать: false
     ❌ Премиум: Эксклюзив + Скачать: false
     ✅ Премиум: Сериал + Скачать: true
     ✅ Pro: Эксклюзив + Ранний доступ: true
     ✅ Pro: Фильм + Скачать: true  */
    
    static func task9_2g() {
        print("Задача 9.2.g: Задача 2: Образовательная платформа. Определить права для разных типов аккаунтов")
        
        enum Plan {
            case trial // пробный аккаунт
            case student
            case teacher
            case school
        }
        
        enum Material {
            case lesson
            case quiz
            case exam
            case certificate
        }
        enum Operation {
            case view
            case attempt
            case create
            case grade
        }
        
        
        // Реализуй:
        func canPerform(plan: Plan, material: Material, operation: Operation) -> Bool {
            switch plan {
            case .trial:
                switch material {
                case .lesson: return operation == .view
                case .quiz, .exam, .certificate: return false // остальные материалы недоступны
                }
            case .student:
                switch material {
                case .lesson, .quiz, .exam: return operation == .view || operation == .attempt
                case .certificate: return operation == .view
                }
            case .teacher:
                switch material {
                case .lesson, .quiz, .exam, .certificate: return operation == .view || operation == .attempt ||
                    operation == .create ||
                    operation == .grade
                }
            case .school:
                return true
            }
        }
        // Тесты
        print("🧪 ТЕСТЫ ОБРАЗОВАТЕЛЬНОЙ ПЛАТФОРМЫ:")
        print("❌ Пробный: Урок + Создать: \(canPerform(plan: .trial, material: .lesson, operation: .create))")
        print("✅ Пробный: Урок + Просмотр: \(canPerform(plan: .trial, material: .lesson, operation: .view))")
        print("✅ Студент: Тест + Прохождение: \(canPerform(plan: .student, material: .quiz, operation: .attempt))")
        print("❌ Студент: Экзамен + Оценить: \(canPerform(plan: .student, material: .exam, operation: .grade))")
        print("✅ Учитель: Урок + Создать: \(canPerform(plan: .teacher, material: .lesson, operation: .create))")
        print("✅ Школа: Сертификат + Оценить: \(canPerform(plan: .school, material: .certificate, operation: .grade))")
        
    } /* 🧪 ТЕСТЫ ОБРАЗОВАТЕЛЬНОЙ ПЛАТФОРМЫ:
       ❌ Пробный: Урок + Создать: false
       ✅ Пробный: Урок + Просмотр: true
       ✅ Студент: Тест + Прохождение: true
       ❌ Студент: Экзамен + Оценить: false
       ✅ Учитель: Урок + Создать: true
       ✅ Школа: Сертификат + Оценить: true */
    
    static func task9_2h() {
        print("Задача 9.2h: Фитнес-приложение. Настроить доступ к функциям по типам членства")
        
        enum MembershipTier { // уровень членства
            case basic, plus, coach, admin
        }
        enum WorkoutPlan { // план тренировки
            case standard, premium, custom, withNutrition
        }
        enum UserActivity {
            case view, start, customize, share
        }
        
        // Реализуй:
        func canDo(membershipTier: MembershipTier, workoutPlan: WorkoutPlan, userActivity: UserActivity) -> Bool {
            switch membershipTier {
            case .basic:
                switch workoutPlan {
                case .standard: return userActivity == .view
                case .premium, .custom, .withNutrition: return false // недоступны
                }
            case .plus:
                switch workoutPlan {
                case .standard, .premium: return userActivity == .view || userActivity == .start
                case .custom, .withNutrition:
                    return false
                }
            case .coach:
                switch workoutPlan {
                case .standard, .premium, .custom, .withNutrition:
                    return true // coach доступны все действия для всех планов
                }
            case .admin:
                return true
            }
        }
        // Тесты
        print("🧪 ТЕСТЫ Фитнес-приложения. Настроить доступ к функциям по типам членства:")
        print("Уровень - начальный: \(canDo(membershipTier: .basic, workoutPlan: .standard, userActivity: .view))")
        print("Уровень - плюс: \(canDo(membershipTier: .plus, workoutPlan: .premium, userActivity: .start))")
        print("Уровень - тренер: \(canDo(membershipTier: .coach, workoutPlan: .premium, userActivity: .customize))")
        print("Уровень - админ: \(canDo(membershipTier: .admin, workoutPlan: .withNutrition, userActivity: .share))")
        print("❌ Basic + Premium + Start: \(canDo(membershipTier: .basic, workoutPlan: .premium, userActivity: .start))")
    }
    /* 🧪 ТЕСТЫ Фитнес-приложения. Настроить доступ к функциям по типам членства:
     Уровень - начальный: true
     Уровень - плюс: true
     Уровень - тренер: true
     Уровень - админ: true
     ❌ Basic + Premium + Start: false */
    
    
    static func task9_2i() {
        print("Задача 9.2i: Интернет-магазин. Разграничить права пользователей в магазине")
        
        enum UserType {
            case guest, buyer, seller, manager
        }
        enum Section {
            case catalog, cart, orders, analytics
        }
        enum Access {
            case view, add, modify, delete
        }
        
        // Реализуй:
        func hasAccess(user: UserType, section: Section, access: Access) -> Bool {
            switch user {
            case .guest:
                switch section {
                case .catalog: return access == .view
                case .cart, .orders, .analytics: return false
                }
            case .buyer:
                switch section {
                case .catalog, .cart, .orders: return access == .view || access == .add
                case .analytics: return false
                }
            case .seller:
                switch section {
                case .catalog: return access == .view || access == .modify || access == .add
                case .orders:
                    return access == .view || access == .modify
                case .analytics: return access == .view
                case .cart:
                    return false
            
                }
            case .manager:
                return true
            }
        }

    // Тесты
       print("🧪 ТЕСТЫ Интернет-магазина:")
       print("👤 Гость + Каталог + Просмотр: \(hasAccess(user: .guest, section: .catalog, access: .view))")
       print("👤 Гость + Корзина + Добавить: \(hasAccess(user: .guest, section: .cart, access: .add))")
       print("🛒 Покупатель + Корзина + Добавить: \(hasAccess(user: .buyer, section: .cart, access: .add))")
       print("🛒 Покупатель + Аналитика + Просмотр: \(hasAccess(user: .buyer, section: .analytics, access: .view))")
       print("🏪 Продавец + Каталог + Изменить: \(hasAccess(user: .seller, section: .catalog, access: .modify))")
       print("🏪 Продавец + Заказы + Удалить: \(hasAccess(user: .seller, section: .orders, access: .delete))")
       print("👑 Менеджер + Аналитика + Удалить: \(hasAccess(user: .manager, section: .analytics, access: .delete))")
   }
    /* Задача 9.2i: Интернет-магазин. Разграничить права пользователей в магазине
     🧪 ТЕСТЫ Интернет-магазина:
     👤 Гость + Каталог + Просмотр: true
     👤 Гость + Корзина + Добавить: false
     🛒 Покупатель + Корзина + Добавить: true
     🛒 Покупатель + Аналитика + Просмотр: false
     🏪 Продавец + Каталог + Изменить: true
     🏪 Продавец + Заказы + Удалить: false
     👑 Менеджер + Аналитика + Удалить: true */
    
    static func task9_2j() {
        print("Задача 9.2j: Электронная библиотека. Ограничить доступ к книгам по возрасту и статусу")
        
        
        enum ReaderLevel {
            case child, teen, adult, scholar
        }
        enum BookType {
            case children, fiction, academic, restricted
        }
        enum Reading {
            case preview, borrow, download, annotate
        }
        
        func canRead(level: ReaderLevel, book: BookType, reading: Reading) -> Bool {
            switch level {
            case .child:
                return book == .children && (reading == .preview || reading == .borrow)
            case .teen:
                return book != .academic && book != .restricted && reading != .annotate
            case .adult:
                return book != .restricted && reading != .annotate
            case .scholar:
                return true
            }
        }
        print("📚 ТЕСТЫ БИБЛИОТЕКИ:")
        print("▫️👤 → 🎈 Детские: \(canRead(level: .child, book: .children, reading: .preview))")
        print("▫️👤 → 📖 Художеств: \(canRead(level: .child, book: .fiction, reading: .download))")
        print("▫️👥 → 🎓 Академия: \(canRead(level: .teen, book: .academic, reading: .annotate))")
        print("▫️👥 → 📚 Художеств: \(canRead(level: .teen, book: .fiction, reading: .borrow))")
        print("▪️🧍 → 🔞 Огранич: \(canRead(level: .adult, book: .restricted, reading: .annotate))")
        print("▪️🧍 → 💾 Скачать: \(canRead(level: .adult, book: .fiction, reading: .download))")
        print("▪️👤🎓 → 🔓 Все: \(canRead(level: .scholar, book: .restricted, reading: .annotate))")
    }
    /* 📚 ТЕСТЫ БИБЛИОТЕКИ:
     ▫️👤 → 🎈 Детские: true
     ▫️👤 → 📖 Художеств: false
     ▫️👥 → 🎓 Академия: false
     ▫️👥 → 📚 Художеств: true
     ▪️🧍 → 🔞 Огранич: false
     ▪️🧍 → 💾 Скачать: true
     ▪️👤🎓 → 🔓 Все: true */
    
    static func task9_3() {
        print("Задача 9.3: ..")
        
    }
    static func task9_4() {
        print("Задача 9.3: ..")
    }
}
/* 📁 Project/
        ├── 🎨 task9_2b.swift - Colors with HEX codes
        ├── 📦 task9_2c.swift - Order status system
        ├── ✅ task9_2d.swift - To-Do task manager
        └── 🔐 task9_2e.swift - Advanced access rights system  */
