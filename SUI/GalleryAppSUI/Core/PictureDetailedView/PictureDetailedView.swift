//
//  PictureDetailedView.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import SwiftUI

struct PictureDetailedView: View {
    @StateObject var viewModel = PictureDetailedViewModel()
    @Binding var control: Bool
    var picture: Work
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ZStack(alignment: .topLeading) {
                Image(picture.image)
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
                }
                .padding()
            }
            .padding(.bottom)
            Text(picture.title)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            Text(picture.info)
                .padding(.horizontal)
                .font(.body)
                .foregroundStyle(Color(.systemGray))
            
            Spacer()
            
            HStack(alignment: .center) {
                Spacer()
                Button {
                    
                } label: {
                    Text("Развернуть")
                        .frame(width: 330, height: 49)
                        .background(.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                }
                .padding(.bottom, 40)
                Spacer()
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PictureDetailedView(control: .constant(true), picture: MockData().example.works[0])
}
