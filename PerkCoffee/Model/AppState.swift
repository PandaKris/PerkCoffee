//
//  AppState.swift
//  PerkCoffee
//
//  Created by Kristanto Sean on 2026-09-03.
//

import Foundation
import Observation

/// The single source of truth for orders. Marked `@MainActor` so both the UI
/// and our intents' `perform()` can touch it without data-race warnings, and
/// exposed as `.shared` so an intent (which the system instantiates on its own)
/// can reach the same state the app's views are showing.

@MainActor
@Observable
final class OrderStore {
    static let shared = OrderStore()

    private(set) var orders: [Order] = []

    private init() {}

    @discardableResult
    func placeOrder(
        coffee: Coffee,
        size: CoffeeSize,
        milk: MilkType,
        quantity: Int
    ) -> Order {
        let unitPrice = coffee.basePrice * size.priceMultiplier
        let total = unitPrice * Decimal(quantity)
        let order = Order(
            id:         UUID(),
            coffeeID:   coffee.id,
            coffeeName: coffee.name,
            size:       size,
            milk:       milk,
            quantity:   quantity,
            total:      total,
            placedAt:   .now
        )
        orders.insert(order, at: 0)
        return order
    }

    func quote(coffee: Coffee, size: CoffeeSize, quantity: Int) -> Decimal {
        coffee.basePrice * size.priceMultiplier * Decimal(quantity)
    }
}

@MainActor
@Observable
final class AppNavigator {
    static let shared = AppNavigator()

    enum Tab: Hashable { case menu, orders }
    var selectedTab: Tab = .menu

    private init() {}
}
