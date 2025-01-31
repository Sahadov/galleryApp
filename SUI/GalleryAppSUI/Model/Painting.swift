//
//  Painting.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 28/01/2025.
//

import Foundation

struct Artist: Codable, Hashable {
    let name: String
    let image: String
    let bio: String
    let works: [Work]
}

struct Work: Codable, Hashable {
    let title: String
    let image: String
    let info: String
}

struct APIResponse: Codable, Hashable {
    let artists: [Artist]
}
