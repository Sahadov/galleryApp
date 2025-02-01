//
//  SearchView.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: ExploreViewModel
    @Binding var search: String
    
    var body: some View {
        HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(.systemGray))
                TextField("Search", text: $search)
                .onSubmit {
                    viewModel.updateListingForArtist()
                }
            
                // Reset search button
                if !viewModel.searchValue.isEmpty {
                    Button {
                        viewModel.searchValue = ""
                        viewModel.updateListingForArtist()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color(.systemGray))
                            .padding(.horizontal, 5)
                    }
                }
            
                }
                    .padding(8)
                    .overlay {
                        Capsule()
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray))
                    }
                    .padding(.horizontal)
    }
}


