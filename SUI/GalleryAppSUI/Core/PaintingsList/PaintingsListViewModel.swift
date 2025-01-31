//
//  PaintingsListViewModel.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 28/01/2025.
//

import Foundation

class PaintingsListViewModel: ObservableObject {
    @Published var artists = [Artist]()
    @Published var errorMessage: String?
    @Published var isShowingDetailView = false
    
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
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}


