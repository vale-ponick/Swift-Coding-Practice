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
        task9_3a()
        task9_4()
    }
    
    static func task9_1() {
        print("Задача 9.1: Напиши, как понимаешь перечисления: что это такое, в чем их смысл, зачем нужны? Как и где их можно использовать?")
        /*
            🎯 ПЕРЕЧИСЛЕНИЯ (enum) - это тип данных для ограниченного набора вариантов
            
            💡 СУТЬ: Фиксируем возможные варианты заранее
            ✅ Компилятор проверяет правильность
            ✅ Код становится понятнее и безопаснее
            
            🏗️ КАК ИСПОЛЬЗОВАТЬ:
            • Статусы (заказ, задача, пользователь)
            • Типы (устройства, роли, категории)
            • Ошибки (коды, сообщения)
            • Состояния (загрузка, успех, ошибка)
            
            🎪 ТИПЫ ENUM:
            1. 🟢 Простой - только case (дни недели, цвета)
            2. 🟡 С ассоциированными значениями - гибкие данные (резюме, устройства)
            3. 🔵 С raw values - фиксированные значения (коды ошибок, API статусы)
            
            💎 КОГДА ИСПОЛЬЗОВАТЬ RAW VALUES:
            • Когда каждому case нужно постоянное значение
            • Для совместимости с внешними системами
            • Когда значения известны и не меняются
            
            🚀 ПРЕИМУЩЕСТВА:
            • 🛡️  Безопасность - нельзя ошибиться в вариантах
            • 📖  Читаемость - код сам документирует себя
            • 🔧  Поддержка - легко добавлять новые случаи
            • 🎯  Структура - организует связанные значения
            */
        }
        // Пример raw values:

        enum HTTPStatus: Int {
            case success = 200
            case notFound = 404
            case serverError = 500
        }

        enum AppError: String {
            case network = "NETWORK_ERROR"
            case auth = "AUTHENTICATION_FAILED"
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
        print("Задача 9.3: Создай свое резюме, используя enum - ...: имя, фамилия, возраст, профессия, навыки, образование, хобби и др. пункты на ваше усмотрение. Пропустите свое резюме через if - else, а затем через switch  - для того, чтобы было понимание читаемости и красоты кода. дайте оценку первому варианту кода и второму.")
        enum  ResumeCategory {
            case name, sername, age, profession, skill, education, hobby
        }
        // данные в словаре
        let resumeData: [ResumeCategory: Any] = [
            .name: "Vale",
            .sername: "Karlova",
            .age: 28,
            .profession: "Swift Developer",
            .skill: ["iOS", "Swift", "XCode", "GitHub"],
            .education: "Applied Computer Science",
            .hobby: ["hiking", "listen to music and audiobooks", "road trips"]
            ]
            print(" === var. 1 with if-else ===")
        for (key, value) in resumeData {
            if key == .name {
                print("Имя: \(value)")
            } else if key == .hobby {
                print("Хобби: \(value)")
            } else if key == .skill {
                print("Навыки: \(value)")
            }
        }
        print("--- var. 2 with switch ---")
        for (key, value) in resumeData {
            switch key {
            case .name: print("Имя: \(value)")
            case .hobby: print("Хобби: \(value)")
            case .skill: print("Навыки: \(value)")
            case .sername: print("Фамилия: \(value)")
            case .age: print("Возраст: \(value)")
            case .profession: print("Профессия: \(value)")
            case .education: print("Образование: \(value)")
            }
        }
    }
    /* === var. 1 with if-else ===
     Имя: Vale
     Навыки: ["iOS", "Swift", "XCode", "GitHub"]
     Хобби: ["hiking", "listen to music and audiobooks", "road trips"]
     --- var. 2 with switch ---
     Имя: Vale
     Образование: Applied Computer Science
     Возраст: 28
     Профессия: Swift Developer
     Навыки: ["iOS", "Swift", "XCode", "GitHub"]
     Фамилия: Karlova
     Хобби: ["hiking", "listen to music and audiobooks", "road trips"]  */
    
    static func task9_3a() {
        print("Задача 9.3a: Создай свое резюме, используя enum с АССИЦИИРОВАННЫМИ значениями: имя, фамилия, возраст, профессия, навыки, образование, хобби и др. пункты на ваше усмотрение. Пропустите свое резюме через if - else, а затем через switch  - для того, чтобы было понимание читаемости и красоты кода. дайте оценку первому варианту кода и второму.")
        
        enum ResumeItem {
            case name(String)
            case surname(String)
            case age(Int)
            case profession(String)
            case skills([String])
            case education(String)
            case hobby([String])
            case languages([String])
            case experience(Int)
        }
        // ✅ ПРАВИЛЬНО: это массив enum cases
        let myResume: [ResumeItem] = [
            .name ("Vale"),
            .surname ("Karlova"),
            .age (28),
            .profession ("Swift Developer"),
            .skills (["iOS", "Swift", "XCode", "GitHub"]),
            .education ("Applied Computer Science"),
            .hobby (["hiking", "listen to music and audiobooks", "road trips"]),
            .languages(["Russian", "English"]),
            .experience (3)
        ]
        
        print("= обработка через if-else =")
        // Вариант с if-else
        for item in myResume {
            if case .name(let value) = item {
                print("Имя: \(value)")
            } else if case .surname(let value) = item {
                print("Фамилия: \(value)")
            } else if case .age(let value) = item {
                print("Возраст: \(value) лет")
            } else if case .profession(let value) = item {
                print("Профессия: \(value)")
            } else if case .skills(let value) = item {
                print("Навыки: \(value.joined(separator: ", "))")
            } else if case .education(let value) = item {
                print("Образование: \(value)")
            } else if case .hobby(let value) = item {
                print("Хобби: \(value.joined(separator: ", "))")
            } else if case .languages(let value) = item {
                print("Языки: \(value.joined(separator: ", "))")
            } else if case .experience(let value) = item {
                print("Опыт работы: \(value) лет")
            }
        }
        
        print("\n=== Обработка через switch ===")
        
        // Вариант с switch
        for item in myResume {
            switch item {
            case .name(let value):
                print("Имя: \(value)")
            case .surname(let value):
                print("Фамилия: \(value)")
            case .age(let value):
                print("Возраст: \(value) лет")
            case .profession(let value):
                print("Профессия: \(value)")
            case .skills(let value):
                print("Навыки: \(value.joined(separator: ", "))")
            case .education(let value):
                print("Образование: \(value)")
            case .hobby(let value):
                print("Хобби: \(value.joined(separator: ", "))")
            case .languages(let value):
                print("Языки: \(value.joined(separator: ", "))")
            case .experience(let value):
                print("Опыт работы: \(value) лет")
            }
        }
        // Сравнение подходов
        print("\n=== СРАВНЕНИЕ ПОДХОДОВ ===")
        print("""
           АНАЛИЗ ЧИТАЕМОСТИ И КРАСОТЫ КОДА:
           
           🔴 IF-ELSE ВАРИАНТ:
           • Громоздкий и многословный синтаксис
           • Дублирование кода (много повторяющихся 'else if case')
           • Сложно добавлять новые кейсы
           • Меньшая производительность (последовательная проверка)
           • Легко допустить ошибку в порядке условий
           
           🟢 SWITCH ВАРИАНТ:
           • Чистый и читаемый код
           • Компилятор проверяет полноту обработки всех случаев
           • Легко добавлять новые кейсы
           • Более производительный (оптимизируется компилятором)
           • Идиоматический подход для Swift
           
           ВЫВОД: Switch демонстрирует лучшую читаемость и поддерживаемость кода!
           """)
    }
    static func task9_4() {
        print("Задача 9.4: Напиши функцию. Создай enum для Apple устройств с ассоциированными значениями (модель, цвета, характеристики). Выведи информацию в формате 'Устройство - цвет' используя массивы и switch.")
      
// 1. Объявление enum - он ОПИСЫВАЕТ структуру (какие данные могут быть)
enum AppleDevice {
    case iPhone(model: String, colors: [String], price: Double)
    case macBook(model: String, colors: [String], screenSize: Double)
    case appleWatch(model: String, colors: [String], hasCellular: Bool, size: Int)
    case iPad(model: String, colors: [String], price: Double, size: (Int))
    
}
func getInfo(device: AppleDevice) -> String {
    switch device {
     case .iPhone(let model, let colors, let price):
         return "iPhone \(model) - \(colors.first ?? "no color")"
         
     case .macBook(let model, let colors, let screenSize):
         return "MacBook \(model) - \(colors.last ?? "no color")"
         
     case .appleWatch(let model, let colors, let hasCellular, let size):
         return "Apple Watch \(model) - \(colors.first ?? "no color")"
    case .iPad(let model, let colors, let price, let size):
           let randomColor = colors.randomElement() ?? "no color"
           return "iPad \(model) - \(randomColor)"
        
     }
 }
// 2. Создание массива - он СОЗДАЕТ конкретные экземпляры
        let devices: [AppleDevice] = [
            .iPhone(model: "17 Pro", colors: ["Black", "White", "Orange"], price: 156.2),
            .macBook(model: "Pro", colors: ["Space Gray", "Silver Aluminium Purple Fog"], screenSize: 16.0),
            .appleWatch(model: "Series 11", colors: ["Space Gray", "Rose Gold", "Silver Aluminium Purple Fog"], hasCellular: false, size: 46),
            .iPad(model: "Pro 11", colors: ["Space Gray", "Silver", "Spase Black"], price: 80.99, size: 11)
            ]
        
        devices.forEach { device in
            print(getInfo(device: device))
        }
    }
}
/* iPhone 17 Pro - Black
 MacBook Pro - Silver Aluminium Purple Fog
 Apple Watch Series 11 - Space Gray
 iPad Pro 11 - Spase Black */


/* 📁 Project/
        ├── 🎨 task9_2b.swift - Colors with HEX codes
        ├── 📦 task9_2c.swift - Order status system
        ├── ✅ task9_2d.swift - To-Do task manager
        └── 🔐 task9_2e.swift - Advanced access rights system  */
