//
//  PictureDetailedViewModel.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import Foundation

class PictureDetailedViewModel: ObservableObject {
    @Published var isShowFullPictureView = false
    @Published var selectedPicture: Work?
}
