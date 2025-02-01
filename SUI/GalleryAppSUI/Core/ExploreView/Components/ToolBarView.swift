//
//  ToolBarView.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import SwiftUI

struct ToolBarView: View {
    @Binding var control: Bool
    
    var body: some View {
        HStack {
            Text("Artists")
                .font(.title).bold()
            
            Spacer()
            
            Button {
                control.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ToolBarView(control: .constant(false))
}
