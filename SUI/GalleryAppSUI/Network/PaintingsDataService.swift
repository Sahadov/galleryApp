//
//  PaintingsDataService.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 28/01/2025.
//

import Foundation

class PaintingsDataService {
    
    private let urlString = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
    
    func fetchPaintingsWithResult(completion: @escaping(Result<[Artist], APIError>) -> Void )  {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request failed ")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
                
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(apiResponse.artists))
            } catch {
                print("DEBUG: Failed to parse JSON with error: \(error)")
                completion(.failure(.jsonParsingFailure))
            }
        }
        .resume()
    }
}
