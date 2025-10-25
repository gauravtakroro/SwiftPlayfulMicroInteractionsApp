//
//  LiquidProgressDemo.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//


import SwiftUI

struct LiquidProgressDemo: View {
    @State private var progress: CGFloat = 0.12

    var body: some View {
        VStack(spacing: 20) {
            Text("Pour the progress — tap to add.")
                .font(.headline)

            LiquidProgressBar(progress: progress)
                .frame(height: 28)
                .padding(.horizontal)

            HStack(spacing: 12) {
                Button("Pour More") {
                    withAnimation(.easeInOut(duration: 0.45)) {
                        progress = min(progress + 0.12, 1.0)
                    }
                }
                .buttonStyle(.borderedProminent)

                Button("Reset") {
                    withAnimation(.easeInOut) {
                        progress = 0.0
                    }
                }
            }
        }
        .padding()
    }
}

struct LiquidProgressBar: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(.systemGray5))

                RoundedRectangle(cornerRadius: 14)
                    .fill(LinearGradient(colors: [.blue.opacity(0.9), .teal.opacity(0.9)], startPoint: .leading, endPoint: .trailing))
                    .frame(width: max(6, geo.size.width * progress))
                    .overlay(
                        WaveView(progress: progress)
                            .frame(width: geo.size.width * progress, height: geo.size.height)
                            .mask(RoundedRectangle(cornerRadius: 14))
                    )
                    .animation(.easeInOut(duration: 0.45), value: progress)
            }
        }
    }
}

//struct WaveView: View {
//    var progress: CGFloat
//
//    var body: some View {
//        GeometryReader { g in
//            let w = g.size.width
//            let h = g.size.height
//            Path { p in
//                let amplitude = max(2, h * 0.08)
//                let mid = h * 0.5
//                p.move(to: .zero)
//                for x in stride(from: 0, through: w, by: 4) {
//                    let relative = x / w
//                    let y = mid + sin(relative * .pi * 4 + Double(progress) * 6) * amplitude
//                    p.addLine(to: CGPoint(x: x, y: y))
//                }
//                p.addLine(to: CGPoint(x: w, y: h))
//                p.addLine(to: CGPoint(x: 0, y: h))
//                p.closeSubpath()
//            }
//            .fill(Color.white.opacity(0.25))
//            .blendMode(.overlay)
//        }
//    }
//}

struct WaveView: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { g in
            let w = g.size.width
            let h = g.size.height
            
            Path { p in
                let amplitude = max(2, h * 0.08)
                let mid = h * 0.5
                
                p.move(to: CGPoint(x: 0, y: mid))
                
                for x in stride(from: 0.0, through: Double(w), by: 4.0) {
                    let relative = x / Double(w)
                    let y = mid + CGFloat(sin(relative * .pi * 4 + Double(progress) * 6) * Double(amplitude))
                    p.addLine(to: CGPoint(x: x, y: y))
                }
                
                p.addLine(to: CGPoint(x: w, y: h))
                p.addLine(to: CGPoint(x: 0, y: h))
                p.closeSubpath()
            }
            .fill(Color.white.opacity(0.25))
            .blendMode(.overlay)
        }
    }
}

