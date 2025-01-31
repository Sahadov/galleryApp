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
            ToolBarView(control: $viewModel.isShowingAddArtistView)
            SearchView(search: $viewModel.searchValue)
            
            List {
                ForEach(viewModel.artists, id: \.self) { artist in
                    ArtistListItem(artist: artist)
                        .onTapGesture {
                            viewModel.selectedArtist = artist
                            viewModel.isShowingDetailView.toggle()
                        }
                }
            }
            .listStyle(.plain)
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
        .fullScreenCover(isPresented: $viewModel.isShowingDetailView) {
            ArtistDetailedView(artist: viewModel.selectedArtist ?? MockData().example, control: $viewModel.isShowingDetailView)
        }
        .fullScreenCover(isPresented: $viewModel.isShowingAddArtistView) {
            AddArtistView()
        }
    }
}

#Preview {
    PaintingsListView()
}
