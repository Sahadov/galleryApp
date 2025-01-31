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
            List {
                ForEach(viewModel.artists, id: \.self) { artist in
                    Text(artist.name)
                }
            }
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
    }
}

#Preview {
    PaintingsListView()
}
