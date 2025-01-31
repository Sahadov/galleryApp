//
//  ContentView.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 28/01/2025.
//

import SwiftUI

struct PaintingsListView: View {
    @StateObject var viewModel = PaintingsListViewModel()
    
    @State var search = ""
    
    var body: some View {
        VStack {
            SearchView(search: $search)
            
            List {
                ForEach(viewModel.artists, id: \.self) { artist in
                    ArtistListItem(artist: artist)
                }
            }
            .listStyle(.plain)
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
