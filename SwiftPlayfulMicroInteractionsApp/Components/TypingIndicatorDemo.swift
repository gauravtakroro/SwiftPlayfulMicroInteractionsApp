//
//  TypingIndicatorDemo.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//


import SwiftUI

struct TypingIndicatorDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Typing indicator — small dots with personality.")
                .font(.headline)
            TypingIndicator()
                .padding()
        }
    }
}

struct TypingIndicator: View {
    @State private var animate = false

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<3) { i in
                Circle()
                    .frame(width: 10, height: 10)
                    .opacity(0.8)
                    .scaleEffect(animate ? 1 : 0.4)
                    .animation(
                        .easeInOut(duration: 0.45)
                            .repeatForever()
                            .delay(Double(i) * 0.15),
                        value: animate
                    )
            }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
        .onAppear { animate = true }
    }
}
