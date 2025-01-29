//
//  ContentView.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 28/01/2025.
//

import SwiftUI

struct PaintingsListView: View {
    @StateObject var viewModel = PaintingsListViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    PaintingsListView()
}
