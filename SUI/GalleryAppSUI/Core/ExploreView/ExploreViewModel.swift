//
//  ExploreViewModel.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var artists = [Artist]()
    @Published var allArtists = [Artist]()
    @Published var errorMessage: String?
    @Published var searchValue = ""
    @Published var selectedArtist: Artist?
    @Published var isShowingDetailView = false
    @Published var isShowingAddArtistView = false
    private var artistsCopy = [Artist]()
    private var addedArtists = [Artist]()
    
    private let service = PaintingsDataService()
    
    init() {
        //StorageManager.shared.deleteArtist(withName: "Repin")
        fetchPaintings()
    }
    
    func fetchPaintings() {
        service.fetchPaintingsWithResult { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let artists):
                    self?.artists = artists
                    self?.addedArtists = StorageManager.shared.getArtists()
                    self?.allArtists = artists + (self?.addedArtists ?? [])
                    self?.artistsCopy = self?.allArtists ?? []
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
        
    }
    
    func updateListingForArtist() {
        let filteredArtists = allArtists.filter({
            $0.name.lowercased().contains(searchValue.lowercased())
        })
        self.allArtists = filteredArtists.isEmpty && searchValue.isEmpty ? artistsCopy : filteredArtists
    }
    
}
