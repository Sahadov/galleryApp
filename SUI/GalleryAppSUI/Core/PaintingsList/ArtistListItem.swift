//
//  ArtistListItem.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import SwiftUI

struct ArtistListItem: View {
    let artist: Artist
    
    var body: some View {
        HStack {
            Image(artist.works[0].image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            VStack(alignment: .leading, spacing: 2) {
                Text(artist.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(artist.bio)
                    .font(.footnote)
                    .truncationMode(.tail)
                    .frame(height: 60)
                Spacer()
            }
        }
        .frame(height: 100)
        .padding(.vertical, 2)
    }
}

#Preview {
    ArtistListItem(artist: MockData().example)
}
