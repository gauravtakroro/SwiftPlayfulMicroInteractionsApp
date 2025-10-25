//
//  WigglyToggleDemo.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//


import SwiftUI

struct WigglyToggleDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Wiggle when toggled — tiny shimmy, big charm.")
                .font(.headline)
            WigglyToggle()
                .padding()
        }
    }
}

struct WigglyToggle: View {
    @State private var isOn = false
    @State private var wiggle = false

    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Playful Mode")
                .font(.title3)
        }
        .toggleStyle(SwitchToggleStyle(tint: .pink))
        .rotationEffect(.degrees(wiggle ? 6 : 0))
        .animation(wiggle ? .easeInOut(duration: 0.08).repeatCount(6, autoreverses: true) : .default, value: wiggle)
        .onChange(of: isOn) { _ in
            wiggle.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                wiggle = false
            }
        }
        .padding()
    }
}
