//
//  HoppyTabItem.swift
//  SwiftPlayfulMicroInteractionsApp
//
//  Created by Gaurav Tak on 25/10/25.
//


import SwiftUI

struct HoppyTabItem: View {
    var systemName: String
    var isSelected: Bool

    @State private var bounce = false

    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: 20))
            .scaleEffect(bounce ? 1.25 : 1)
            .onChange(of: isSelected) { selected in
                if selected {
                    withAnimation(.interpolatingSpring(stiffness: 350, damping: 12)) {
                        bounce = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                        bounce = false
                    }
                }
            }
    }
}
