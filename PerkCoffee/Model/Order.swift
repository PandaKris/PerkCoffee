//
//  Order.swift
//  PerkCoffee
//
//  Created by Kristanto Sean on 2026-09-03.
//


import Foundation

struct Order: Identifiable, Hashable, Sendable {
    let id: UUID
    let coffeeID: String
    let coffeeName: String
    let size: CoffeeSize
    let milk: MilkType
    let quantity: Int
    let total: Decimal
    let placedAt: Date

    /// e.g. "2 large Latte" or "small Americano"
    var summary: String {
        let prefix = quantity == 1 ? "" : "\(quantity) "
        return "\(prefix)\(size.rawValue) \(coffeeName)"
    }

    var formattedTotal: String {
        total.formatted(.currency(code: "IDR"))
    }
}
