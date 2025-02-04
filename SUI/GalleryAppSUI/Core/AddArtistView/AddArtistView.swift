import SwiftUI
import PhotosUI

struct AddArtistView: View {
    @StateObject var viewModel = AddArtistViewModel()
    @Binding var isShowingAddArtistView: Bool
    
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var artistImage: UIImage?
    
    @State private var worksPhotosPickerItems: [PhotosPickerItem?] = []
    @State private var worksSelectedImages: [Int: UIImage] = [:]

    

    var body: some View {
        
        ZStack {
            VStack {
                ZStack(alignment: .topLeading) {
                    HStack {
                        Spacer()
                        Text("Добавить художника")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom, 20)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .background(.blue)
                    
                    Button {
                        withAnimation(.snappy) {
                            isShowingAddArtistView.toggle()
                        }
                    } label: {
                        Image(systemName: "arrow.backward")
                            .foregroundStyle(.white)
                            .font(.body)
                            .frame(width: 40, height: 40)
                    }
                }

                Form {
                    Section(header: Text("Информация о художнике")) {
                        TextField("Имя", text: $viewModel.newArtist.name)
                            .autocorrectionDisabled()
                        TextField("Биография", text: $viewModel.newArtist.bio)
                        PhotosPicker(selection: $photosPickerItem, matching: .images) {
                            if !viewModel.newArtist.image.isEmpty {
                                Label("Выбрано", systemImage: "photo.badge.checkmark.fill")
                                    .foregroundStyle(Color(.systemGray4))
                            } else {
                                Label("Выбрать изображение", systemImage: "photo.artframe")
                                    .foregroundStyle(Color(.systemGray4))
                            }
                        }
                    }
                }
                .frame(height: 200)
                .offset(y: -10)
                .onChange(of: photosPickerItem) { _, _ in
                    Task {
                        if let photosPickerItem,
                           let data = try? await photosPickerItem.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                                artistImage = image
                                viewModel.newArtist.image = ImageStorageManager.shared.saveImageToFile(image: image) ?? "" // ✅ Сохраняем в FileManager и в модель
                            }
                                photosPickerItem = nil
                        }
                }
                
                HStack {
                    Text("Работы художника")
                        .foregroundStyle(.blue)
                        .padding(.horizontal)
                    Spacer()
                    Button {
                        withAnimation(.snappy) {
                            viewModel.addWork()
                            worksPhotosPickerItems.append(nil)
                        }
                    } label: {
                        Image(systemName: "plus.app")
                    }
                    
                    if !viewModel.newArtist.works.isEmpty {
                        Button {
                            withAnimation(.snappy) {
                                viewModel.removeWork()
                                worksPhotosPickerItems.removeLast()
                            }
                        } label: {
                            Image(systemName: "minus.square")
                        }
                    }
                    
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.newArtist.works.indices, id: \.self) { index in
                            VStack {
                                TextField("Название работы", text: $viewModel.newArtist.works[index].title)
                                TextField("Описание", text: $viewModel.newArtist.works[index].info)
                                //TextField("Изображение", text: $viewModel.newArtist.works[index].image)
                                
                                
                                PhotosPicker(selection: Binding(
                                                get: { worksPhotosPickerItems[index] },
                                                set: { worksPhotosPickerItems[index] = $0 }
                                ), matching: .images) {
                                    if viewModel.newArtist.works[index].image.isEmpty {
                                        Label("Выбрать изображение", systemImage: "photo.artframe")
                                            .foregroundStyle(Color(.systemGray4))
                                    } else {
                                        Label("Выбрано", systemImage: "photo.badge.checkmark.fill")
                                            .foregroundStyle(Color(.systemGray4))
                                    }
                                    
                                }
                                .onChange(of: worksPhotosPickerItems[index]) { _, _ in
                                        Task {
                                            if let worksPhotosPickerItem = worksPhotosPickerItems[index],
                                               let data = try? await worksPhotosPickerItem.loadTransferable(type: Data.self),
                                               let image = UIImage(data: data) {
                                                viewModel.newArtist.works[index].image = ImageStorageManager.shared.saveImageToFile(image: image) ?? ""
                                                print(viewModel.newArtist.works[index].image)
                                        }
                                    }
                                }
                                
                                
                            }
                            .padding()
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.blue)
                            }
                            .overlay(alignment: .topLeading) {
                                Text("\(index + 1)")
                                    .foregroundStyle(.white)
                                    .frame(width: 20, height: 20)
                                    .background(.blue)
                                    .clipShape(Circle())
                                    .offset(x: -5, y: -5)
                            }
                            .padding()
                        }
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                
                Spacer()
                
                Button {
                    viewModel.saveNewArtist()
                } label: {
                    Text("Сохранить")
                        .frame(width: 330, height: 49)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.bottom)
                
            }
            
            
            VStack {
                if viewModel.showEmoji {
                    VStack {
                        Text("🎉")
                            .font(.system(size: 100))
                            .foregroundStyle(.white)
                        Text("Новый художник добавлен")
                            .foregroundStyle(.white)
                    }
                    .transition(.opacity) // Smooth fade-in/out animation
                    .frame(width: UIScreen.main.bounds.size.width,
                           height: UIScreen.main.bounds.size.height)
                    .background(.blue)
                }
            }
            
        }
        
        
       
        
        
        

    }
}

#Preview {
    AddArtistView(isShowingAddArtistView: .constant(true))
}
