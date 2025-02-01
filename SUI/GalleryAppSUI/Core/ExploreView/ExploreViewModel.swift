//
//  ExploreViewModel.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var artists = [Artist]()
    @Published var errorMessage: String?
    @Published var searchValue = ""
    @Published var selectedArtist: Artist?
    @Published var isShowingDetailView = false
    @Published var isShowingAddArtistView = false
    private var artistsCopy = [Artist]()
    
    private let service = PaintingsDataService()
    
    init() {
        fetchPaintings()
    }
    
    func fetchPaintings() {
        service.fetchPaintingsWithResult { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let artists):
                    self?.artists = artists
                    self?.artistsCopy = artists
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
        
    }
    
    func updateListingForArtist() {
        let filteredArtists = artists.filter({
            $0.name.lowercased().contains(searchValue.lowercased())
        })
        self.artists = filteredArtists.isEmpty && searchValue.isEmpty ? artistsCopy : filteredArtists
    }
    
}
