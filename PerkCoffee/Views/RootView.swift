//
//  RootView.swift
//  PerkCoffee
//
//  Created by Kristanto Sean on 2026-09-03.
//


import SwiftUI

struct RootView: View {
    @State private var navigator = AppNavigator.shared

    var body: some View {
        TabView(selection: tabSelection) {
            MenuView()
                .tabItem { Label("Menu", systemImage: "cup.and.saucer.fill") }
                .tag(AppNavigator.Tab.menu)

            OrdersView()
                .tabItem { Label("Orders", systemImage: "list.bullet") }
                .tag(AppNavigator.Tab.orders)
        }
        .tint(.brown)
    }

    private var tabSelection: Binding<AppNavigator.Tab> {
        Binding(
            get: { navigator.selectedTab },
            set: { navigator.selectedTab = $0 }
        )
    }
}

#Preview {
    RootView()
}
