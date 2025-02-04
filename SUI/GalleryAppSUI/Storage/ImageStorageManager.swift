//
//  ImageStorageManager.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 03/02/2025.
//

import SwiftUI

class ImageStorageManager {
    static let shared = ImageStorageManager()
    
    private let userDefaultsKey = "savedArtistImagePath"
    
    // Сохранение изображения в FileManager
    func saveImageToFile(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }
        
        let fileName = UUID().uuidString + ".jpg"
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        
        do {
            try data.write(to: fileURL)
            print("DEBUG: \(fileName)")
            return fileName
        } catch {
            print("❌ Ошибка сохранения изображения: \(error)")
            return nil
        }
    }
    
    // Загрузка изображения из FileManager
    func loadImageFromFile(fileName: String) -> UIImage? {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        if let imageData = try? Data(contentsOf: fileURL) {
            return UIImage(data: imageData)
        }
        return nil
    }
    
    // Получение пути к папке Documents
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
