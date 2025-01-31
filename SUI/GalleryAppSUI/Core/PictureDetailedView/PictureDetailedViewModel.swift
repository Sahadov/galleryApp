//
//  PictureDetailedViewModel.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import Foundation

class PictureDetailedViewModel: ObservableObject {
    @Published var isShowDetailedPictureView = false
    @Published var selectedPicture: Work?
}
