//MARK: - 1
enum Currency: String {
    case usd = "USD"
    case eur = "EUR"
    case byn = "BYN"
}
func getExchangeRate(from: Currency, to: Currency) -> Double? {
    if from == to {
        return 1.0
    }
    switch from {
    case .usd:
        if to == .eur { return 0.85 }
        if to == .byn { return 2.82 }
    case .eur:
        if to == .usd { return 1.17 }
        if to == .byn { return 3.31 }
    case . byn:
        if to == .eur { return 0.30 }
        if to == .usd { return 0.35 }
    }
    return nil
}
let rate = getExchangeRate(from: .usd, to: .byn)
print(rate ?? "нет данных!")

func convertCurrency(amount: Double, from: Currency, to: Currency) -> Double? {
    if amount < 0 {
        return nil
    }
    guard let rate = getExchangeRate(from: from, to: to)
    else {
        return nil
    }
return amount * rate
}
let firstAmount = convertCurrency(amount: 100, from: .usd, to: .eur)
print (firstAmount ?? "нет данных!")

//MARK: - 2
enum Grade: Int {
    case A = 100
    case B = 90
    case C = 70
    case D = 40
    case F = 20
}
func getLetterGrade(score: Int) -> Grade? {
    if score <= 0 || score > 100 {
        return nil
    }
    switch score {
    case 91...100:
        return .A
    case 71...90:
        return .B
    case 41...70:
        return .C
    case 21...40:
        return .D
    default:
        return .F
    }
}
let score1 = 90
if let grade = getLetterGrade(score: score1) {
    print("Балл: \(score1) = \(grade)")
} else {
    print("Неверный балл!")
}

func printExamResult(name: String, score: Int) -> String {
    let grade = getLetterGrade(score: score)
    return grade.map { "\(name) получил \($0) (Балл: \(score))" }
    ?? "\(name) получил недопустимый балл: \(score)"
}
let stedunt1 = printExamResult(name: "Misha", score: 94)
print(stedunt1)
let studet2 = printExamResult(name: "Alex", score: -3)
print(studet2)
