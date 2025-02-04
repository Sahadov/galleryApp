//
//  Painting.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 28/01/2025.
//

import Foundation

struct Artist: Codable, Hashable {
    var name: String
    var image: String
    var bio: String
    var works: [Work]
}

struct Work: Codable, Hashable {
    var title: String
    var image: String
    var info: String
}

struct APIResponse: Codable, Hashable {
    let artists: [Artist]
}
