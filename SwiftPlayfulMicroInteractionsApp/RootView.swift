//
//  RootView.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//

import SwiftUI

struct RootView: View {
    @State private var selectedTab = 0

    var body: some View {
        NavigationView {
            ContentView()
        }
//        TabView(selection: $selectedTab) {
//
//            .tabItem {
//                VStack {
//                    HoppyTabItem(systemName: "star.fill", isSelected: selectedTab == 0)
//                    Text("Playground")
//                }
//            }
//            .tag(0)
//
//            NavigationView {
//                TryAllView()
//            }
//            .tabItem {
//                VStack {
//                    HoppyTabItem(systemName: "sparkles", isSelected: selectedTab == 1)
//                    Text("Try All")
//                }
//            }
//            .tag(1)
//        }
    }
}
