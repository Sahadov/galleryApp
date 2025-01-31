//
//  ArtistDetailedViewModel.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import Foundation

class ArtistDetailedViewModel: ObservableObject {
    @Published var isShowDetailedPictureView = false
    @Published var selectedPicture: Work?
}
