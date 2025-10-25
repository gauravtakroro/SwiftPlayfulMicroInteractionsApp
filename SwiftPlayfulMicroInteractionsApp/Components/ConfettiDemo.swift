//
//  ConfettiDemo.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//


import SwiftUI

struct ConfettiDemo: View {
    @State private var burst = false
    @State private var counter = 0

    var body: some View {
        VStack(spacing: 24) {
            Text("Celebrate! Tap 'Celebrate' for confetti.")
                .font(.headline)

            ZStack {
                Button(action: {
                    burstOnce()
                }) {
                    Text("Celebrate")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.mint))
                        .foregroundColor(.white)
                }

                ConfettiView(animate: $burst)
                    .allowsHitTesting(false)
            }
            .frame(height: 160)
        }
        .padding()
    }

    func burstOnce() {
        counter += 1
        withAnimation { burst = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation { burst = false }
        }
    }
}

struct ConfettiView: View {
    @Binding var animate: Bool
    let confettiCount = 18

    var body: some View {
        GeometryReader { geo in
            ForEach(0..<confettiCount, id: \.self) { i in
                ConfettiPiece(index: i, animate: animate, size: geo.size)
            }
        }
    }
}

struct ConfettiPiece: View {
    let index: Int
    let animate: Bool
    let size: CGSize

    @State private var offset: CGSize = .zero
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1.0

    var body: some View {
        Rectangle()
            .fill(randomColor(index: index))
            .frame(width: 10, height: 16)
            .rotationEffect(.degrees(rotation))
            .scaleEffect(scale)
            .offset(offset)
            .opacity(animate ? 1 : 0)
            .onChange(of: animate) { new in
                if new {
                    explode()
                } else {
                    reset()
                }
            }
            .onAppear {
                reset()
            }
    }

    func explode() {
        let width = size.width
        let height = size.height

        let tx = CGFloat.random(in: -width*0.6...width*0.6)
        let ty = CGFloat.random(in: -height*0.8...height*0.1)
        let fall = CGFloat.random(in: height*0.6...height*1.4)
        let delay = Double(index) * 0.02

        withAnimation(.easeOut(duration: 0.18).delay(delay)) {
            offset = CGSize(width: tx, height: ty)
            rotation = Double.random(in: -30...30)
            scale = CGFloat.random(in: 0.8...1.3)
        }

        withAnimation(.easeIn(duration: 0.8).delay(delay + 0.18)) {
            offset = CGSize(width: tx + CGFloat.random(in: -40...40), height: fall)
            rotation += Double.random(in: 90...360)
            scale = 0.7
        }
    }

    func reset() {
        offset = .zero
        rotation = 0
        scale = 1.0
    }

    func randomColor(index: Int) -> Color {
        let palette: [Color] = [.pink, .yellow, .blue, .mint, .orange, .purple]
        return palette[index % palette.count]
    }
}
