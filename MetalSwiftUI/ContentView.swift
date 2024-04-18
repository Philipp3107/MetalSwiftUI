//
//  ContentView.swift
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 18.04.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0, content: {
            Rectangle()
                .foregroundStyle(.green)
                .frame(minWidth: 300, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            MetalView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
    }
}

#Preview {
    ContentView()
}
