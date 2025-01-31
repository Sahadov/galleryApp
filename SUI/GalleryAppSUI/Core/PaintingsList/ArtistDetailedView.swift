//
//  ArtistDetailedView.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import SwiftUI

struct ArtistDetailedView: View {
    let artist: Artist
    @Binding var control: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ZStack(alignment: .bottomLeading) {
                    Image(artist.image)
                        .resizable()
                        .frame(height: 350)
                        .scaledToFill()
                    VStack(alignment: .leading) {
                        Button {
                            control.toggle()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundStyle(.white)
                                .font(.body)
                                .frame(width: 40, height: 40)
                        }
                        .padding(.top, 20)
                        Spacer()
                        Text(artist.name)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        Text("Author")
                            .font(.body)
                            .foregroundStyle(Color(.systemGray2))
                    }
                    .padding()
                }
                .padding(.bottom)
                Text("Biography")
                    .font(.title3)
                    .padding(.horizontal)
                Text(artist.bio)
                    .padding(.horizontal)
                    .font(.body)
                    .foregroundStyle(Color(.systemGray))
                Text("Works")
                    .font(.title3)
                    .padding(.horizontal)
                ForEach(artist.works, id: \.self) { work in
                    VStack(alignment: .center){
                        Image(work.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.size.width, height: 200)
                        Text("\(work.title) by \(artist.name)")
                            .padding(.horizontal)
                            .padding(.bottom)
                            .foregroundStyle(Color(.systemGray))
                    }
                    
                }
            }
        }
        .padding(.bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    ArtistDetailedView(artist: MockData().example, control: .constant(true))
}
