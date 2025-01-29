//
//  PaintingsListViewModel.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 28/01/2025.
//

import Foundation

class PaintingsListViewModel: ObservableObject {
    @Published var paintings: [Artist]?
    private let service = PaintingsDataService()
    
    init() {
        fetchPaintings()
    }
    
    func fetchPaintings() {
        service.fetchPaintings { artists, error in
            print(artists)
        }
    }
}

