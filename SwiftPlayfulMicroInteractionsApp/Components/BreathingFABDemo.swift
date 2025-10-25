//
//  BreathingFABDemo.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//


import SwiftUI

struct BreathingFABDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("A calm, breathing FAB.")
                .font(.headline)

            Spacer()

            BreathingFAB(action: {
                // small action
            })
            .padding()
        }
    }
}

struct BreathingFAB: View {
    var action: () -> Void
    @State private var breathe = false

    var body: some View {
        Button(action: {
            feedback()
            action()
        }) {
            Image(systemName: "plus")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
                .padding(20)
                .background(Circle().fill(LinearGradient(colors: [.blue, .teal], startPoint: .topLeading, endPoint: .bottomTrailing)))
                .shadow(radius: 10)
                .scaleEffect(breathe ? 1.06 : 0.96)
                .animation(.easeInOut(duration: 1.1).repeatForever(autoreverses: true), value: breathe)
        }
        .onAppear { breathe = true }
    }

    private func feedback() {
        let gen = UIImpactFeedbackGenerator(style: .medium)
        gen.impactOccurred()
    }
}
