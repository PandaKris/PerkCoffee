//
//  Coffee.swift
//  PerkCoffee
//
//  Created by Kristanto Sean on 2026-09-03.
//


import Foundation
import AppIntents

struct Coffee: Identifiable, Hashable, Sendable {
    let id: String
    let name: String
    let basePrice: Decimal
    let symbol: String
}

enum CoffeeMenu {
    static let all: [Coffee] = [
        Coffee(
            id: "latte",
            name: "Latte",
            basePrice: 45_000,
            symbol: "cup.and.saucer.fill"
        ),
        Coffee(
            id: "cappuccino",
            name: "Cappuccino",
            basePrice: 42_500,
            symbol: "cup.and.saucer.fill"
        ),
        Coffee(
            id: "americano",
            name: "Americano",
            basePrice: 35_000,
            symbol: "mug.fill"
        ),
        Coffee(
            id: "cold-brew",
            name: "Cold Brew",
            basePrice: 47_500,
            symbol: "takeoutbag.and.cup.and.straw.fill"
        ),
        Coffee(
            id: "mocha",
            name: "Mocha",
            basePrice: 50_000,
            symbol: "cup.and.saucer.fill"
        ),
        Coffee(
            id: "espresso",
            name: "Espresso",
            basePrice: 30_000,
            symbol: "cup.and.saucer.fill"
        ),
    ]
    static func coffee(id: String) -> Coffee? { all.first { $0.id == id } }
}

enum CoffeeSize: String, CaseIterable, AppEnum {
    case small, medium, large
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Size"
    static var caseDisplayRepresentations: [CoffeeSize: DisplayRepresentation] = [
        .small: "Small",
        .medium: "Medium",
        .large: "Large",
    ]
    var priceMultiplier: Decimal {
        switch self {
            case .small: 0.85;
            case .medium: 1.00;
            case .large: 1.25
        }
    }
}

enum MilkType: String, CaseIterable, AppEnum {
    case whole, oat, almond, none
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Milk"
    static var caseDisplayRepresentations: [MilkType: DisplayRepresentation] = [
        .whole: "Whole milk",
        .oat: "Oat milk",
        .almond: "Almond milk",
        .none: "No milk",
    ]
}
