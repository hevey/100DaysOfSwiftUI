//
//  ContentView.swift
//  Animations
//
//  Created by Glenn Hevey on 29/6/2023.
//

import SwiftUI

struct CorenerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CorenerRotateModifier(amount: -90, anchor: .topLeading), identity: CorenerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
        
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
