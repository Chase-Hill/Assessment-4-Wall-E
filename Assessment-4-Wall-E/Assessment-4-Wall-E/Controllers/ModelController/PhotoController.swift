//
//  PhotoController.swift
//  Assessment-4-Wall-E
//
//  Created by Chase on 2/27/23.
//

import Foundation

struct PhotoController {
    
    static func fetchPhotos(searchTerm: String, completion: @escaping (Result<Photo, NetworkError> ) -> Void) {
        
        guard let baseURL = URL(string: Constants.NASAURL.baseURL) else { completion(.failure(.invalidURL)) ; return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let apiQuery = URLQueryItem(name: Constants.NASAURL.queryKey, value: Constants.NASAURL.queryValue)
        let dateQuery = URLQueryItem(name: Constants.NASAURL.dateKey, value: searchTerm)
        urlComponents?.queryItems = [apiQuery, dateQuery]
        
        guard let finalURL = urlComponents?.url else { completion(.failure(.invalidURL)) ; return }
        print("Final Photo URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { photoData, response, error in
            if let error = error {
                completion(.failure(.thrownError(error))) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            guard let data = photoData else { completion(.failure(.noData)) ; return }
            
            do {
                
                let photo = try JSONDecoder().decode(Photo.self, from: data)
                completion(.success(photo))
                
            } catch {
                
                completion(.failure(.unableToDecode))
            }
        } .resume()
    }
}
