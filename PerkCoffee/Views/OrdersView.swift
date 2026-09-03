//
//  OrdersView.swift
//  PerkCoffee
//
//  Created by Kristanto Sean on 2026-09-03.
//


import SwiftUI

struct OrdersView: View {
    @State private var store = OrderStore.shared

    var body: some View {
        NavigationStack {
            Group {
                if store.orders.isEmpty {
                    ContentUnavailableView(
                        "No orders yet",
                        systemImage: "cup.and.saucer",
                        description: Text("Order from the menu, or ask Siri to order for you.")
                    )
                } else {
                    List(store.orders) { order in
                        VStack(alignment: .leading, spacing: 3) {
                            Text(order.summary.capitalized).font(.headline)
                            Text("\(order.milk.rawValue.capitalized) milk · \(order.formattedTotal)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 2)
                    }
                }
            }
            .navigationTitle("Orders")
        }
    }
}

#Preview {
    OrdersView()
}
