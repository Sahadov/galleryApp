//
//  StorageManager.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 03/02/2025.
//

import Foundation

final class StorageManager {
    static let shared = StorageManager()
    private let defaults = UserDefaults.standard
    private let artistsKey = "artists"

    private init() {}
    
    func saveArtists(_ artists: [Artist]) {
        if let encoded = try? JSONEncoder().encode(artists) {
            defaults.set(encoded, forKey: artistsKey)
        }
    }

    func addArtist(_ artist: Artist) {
        var artists = getArtists()
        artists.append(artist)
        saveArtists(artists)
    }

    func getArtists() -> [Artist] {
        if let data = defaults.data(forKey: artistsKey),
            let decoded = try? JSONDecoder().decode([Artist].self, from: data) {
            return decoded
        }
        return []
    }
    
    func deleteArtist(withName name: String) {
            var artists = getArtists()
            artists.removeAll { $0.name == name }
            saveArtists(artists)
    }
}
