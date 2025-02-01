//
//  ExploreView.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        VStack {
            ToolBarView(control: $viewModel.isShowingAddArtistView)
            SearchView(viewModel: viewModel, search: $viewModel.searchValue)
            
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
            if viewModel.artists.isEmpty {
                VStack {
                    Image(systemName: "figure.climbing")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                        .padding()
                    Text("Oooppsss... No matches.")
                        .foregroundStyle(.gray)
                        .font(.body)
                }
                
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
    ExploreView()
}
