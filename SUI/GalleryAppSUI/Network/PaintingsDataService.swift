//
//  PaintingsDataService.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 28/01/2025.
//

import Foundation

class PaintingsDataService {
    
    func fetchPaintings(completion: @escaping([Artist]?, Error?) -> Void )  {
       
        let urlString = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                
                if let error {
                    completion(nil, error)
                }
                
                guard let data else { return }
                guard let apiResponse = try? JSONDecoder().decode(APIResponse.self, from: data) else { return }
                
                completion(apiResponse.artists, nil)
            }
        }
        .resume()
    }
}
