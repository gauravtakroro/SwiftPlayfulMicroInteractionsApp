//
//  TryAllView.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//


import SwiftUI

struct TryAllView: View {
    @State private var progressValue: CGFloat = 0.2
    @State private var showConfetti = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Try All — a buffet of micro-interactions")
                    .font(.title2).bold()

                BouncyButton(isLiked: .constant(false))
                    .padding(.vertical)

                WigglyToggle()
                    .padding(.vertical)

                BreathingFAB(action: {})

                TypingIndicator()

                ConfettiDemo()

                LiquidProgressBar(progress: progressValue)
                    .frame(height: 28)
                    .padding(.horizontal)

                HStack {
                    Button("Add") {
                        withAnimation { progressValue = min(progressValue + 0.12, 1.0) }
                    }
                    Button("Reset") {
                        withAnimation { progressValue = 0.0 }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Try All")
    }
}
