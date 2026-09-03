//
//  MenuView.swift
//  PerkCoffee
//
//  Created by Kristanto Sean on 2026-09-03.
//


import SwiftUI

struct MenuView: View {
    @State private var store = OrderStore.shared

    var body: some View {
        NavigationStack {
            List(CoffeeMenu.all) { coffee in
                HStack(spacing: 12) {
                    Image(systemName: coffee.symbol)
                        .foregroundStyle(.brown)
                        .frame(width: 30)

                    VStack(alignment: .leading) {
                        Text(coffee.name).font(.headline)
                        Text(coffee.basePrice.formatted(.currency(code: "IDR")))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    Button("Order") {
                        store.placeOrder(coffee: coffee, size: .medium, milk: .whole, quantity: 1)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.brown)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Perk")
        }
    }
}

#Preview {
    MenuView()
}
