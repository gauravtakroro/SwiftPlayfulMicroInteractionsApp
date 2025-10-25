//
//  ContentView.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            NavigationLink("Bouncy Button") { DemoDetail(title: "Bouncy Button", view: AnyView(BouncyButtonDemo())) }
            NavigationLink("Wiggly Toggle") { DemoDetail(title: "Wiggly Toggle", view: AnyView(WigglyToggleDemo())) }
            NavigationLink("Breathing FAB") { DemoDetail(title: "Breathing FAB", view: AnyView(BreathingFABDemo())) }
            NavigationLink("Typing Indicator") { DemoDetail(title: "Typing Indicator", view: AnyView(TypingIndicatorDemo())) }
            NavigationLink("Confetti Celebration") { DemoDetail(title: "Confetti Celebration", view: AnyView(ConfettiDemo())) }
            NavigationLink("Liquid Progress") { DemoDetail(title: "Liquid Progress", view: AnyView(LiquidProgressDemo())) }
            NavigationLink("Light/Dark Switch") { DemoDetail(title: "Light/Dark Switch", view: AnyView(TheatricalToggleDemo())) }
        }
        .navigationTitle("SwiftPlayfulApp")
    }
}

struct DemoDetail: View {
    let title: String
    let view: AnyView

    var body: some View {
        VStack {
            view
        }
        .navigationTitle(title)
        .padding()
    }
}
