//
//  SearchView.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import SwiftUI

struct SearchView: View {
    @Binding var search: String
    
    var body: some View {
        HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(.systemGray))
                TextField("Search", text: $search)
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


