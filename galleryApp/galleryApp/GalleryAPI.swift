//
//  GalleryAPI.swift
//  galleryApp
//
//  Created by Дмитрий Волков on 19.09.2024.
//

import UIKit

struct GalleryAPI {
    
    static let shared = GalleryAPI()
    
    func fetchGallery(onCompletion: @escaping ([Artist]) -> ()) {
        let urlString = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url){ (data, resp, error) in
            guard let data = data else {
                print("Data was nill")
                return
            }
            guard let artistsList = try? JSONDecoder().decode(ArtistsList.self, from: data) else {
                print("Couldn't decode JSON")
                return
            }
            onCompletion(artistsList.artists)
        }
        task.resume()
    }
    
}

struct ArtistsList: Codable {
    let artists: [Artist]
}

struct Artist: Codable {
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

struct Work: Codable {
    let title: String
    let image: String
    let info: String
}
