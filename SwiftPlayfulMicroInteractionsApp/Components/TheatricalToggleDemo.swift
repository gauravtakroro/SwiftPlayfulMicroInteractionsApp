//
//  TheatricalToggleDemo.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//


import SwiftUI

struct TheatricalToggleDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Sun ↔ Moon with a little spin.")
                .font(.headline)
            TheatricalToggle()
        }
        .padding()
    }
}

struct TheatricalToggle: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var spin = false

    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.6)) {
                isDarkMode.toggle()
                spin = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                spin = false
            }
        } label: {
            Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                .font(.system(size: 44))
                .rotationEffect(.degrees(spin ? 180 : 0))
                .scaleEffect(isDarkMode ? 0.9 : 1.05)
                .foregroundColor(isDarkMode ? .yellow : .orange)
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
