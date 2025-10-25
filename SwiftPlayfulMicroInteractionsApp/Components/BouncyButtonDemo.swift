//
//  BouncyButtonDemo.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//


import SwiftUI
import UIKit

struct BouncyButtonDemo: View {
    @State private var liked = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Tap the heart — it celebrates you.")
                .font(.headline)

            BouncyButton(isLiked: $liked)
        }
        .padding()
    }
}

struct BouncyButton: View {
    @Binding var isLiked: Bool
    @State private var scale: CGFloat = 1

    var body: some View {
        Button {
            withAnimation(.interpolatingSpring(stiffness: 300, damping: 12)) {
                isLiked.toggle()
                scale = 1.4
            }
            withAnimation(.spring().delay(0.12)) {
                scale = 1
            }
        } label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 72, height: 72)
                .foregroundStyle(isLiked ? .linearGradient(colors: [.red, .pink], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [.gray, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                .scaleEffect(scale)
                .shadow(radius: isLiked ? 8 : 2)
        }
    }
}
