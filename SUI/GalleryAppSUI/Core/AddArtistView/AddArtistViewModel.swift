//
//  AddArtistViewModel.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 03/02/2025.
//

import SwiftUI

class AddArtistViewModel: ObservableObject {
    @Published var newArtist = Artist(name: "", image: "", bio: "", works: [])
    @Published var showEmoji = false
    private var artists: [Artist] = StorageManager.shared.getArtists()
    
    
    func addWork(){
        newArtist.works.append(Work(title: "", image: "", info: ""))
    }
    
    func removeWork(){
        if !newArtist.works.isEmpty {
            newArtist.works.removeLast()
        }
    }
    
    func saveNewArtist() {
        StorageManager.shared.addArtist(newArtist)
        newArtist = Artist(name: "", image: "", bio: "", works: [])
        
        withAnimation(.snappy) {
            showEmoji = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            withAnimation(.snappy) {
                self?.showEmoji = false
            }
        }
        
        print("Added")
    }
    
}
