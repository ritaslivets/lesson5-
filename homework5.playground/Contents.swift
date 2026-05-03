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
