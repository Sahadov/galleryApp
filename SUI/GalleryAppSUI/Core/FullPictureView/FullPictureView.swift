//
//  FullPictureView.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import SwiftUI

struct FullPictureView: View {
    var picture: Work
    @Binding var control: Bool
    
    var body: some View {
        Spacer()
        Image(picture.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
        Spacer()
        HStack() {
            Spacer()
            Button {
                control.toggle()
            } label: {
                Image(systemName: "xmark.circle")
                    .foregroundStyle(.gray)
                    .font(.largeTitle)
                    .frame(width: 40, height: 40)
            }
            .padding()
        }
            
    }
}

#Preview {
    FullPictureView(picture: MockData().example.works[0], control: .constant(true))
}
