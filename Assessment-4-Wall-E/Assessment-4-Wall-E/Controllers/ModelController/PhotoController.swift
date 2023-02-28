//
//  PhotoController.swift
//  Assessment-4-Wall-E
//
//  Created by Chase on 2/27/23.
//

import Foundation

class PhotoController {
    
    static func fetchPhotos(searchTerm: String, completion: @escaping (Photo?) -> Void) {
        
        //Struct my final URL - //https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=6FWUge4KKZMAWtAY8KrBypHzHiPnQMitR3EhbTRX&earth_date=2015-6-3
        
        guard let baseURL = URL(string: Constants.NASAURL.baseURL) else { completion(nil) ; return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let apiQuery = URLQueryItem(name: Constants.NASAURL.queryKey, value: Constants.NASAURL.queryValue)
        let dateQuery = URLQueryItem(name: Constants.NASAURL.dateKey, value: searchTerm)
        urlComponents?.queryItems = [apiQuery, dateQuery]
        
        guard let finalURL = urlComponents?.url else { completion(nil) ; return }
        print("Final Photo URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { photoData, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            guard let data = photoData else { print("There was an error recieving the data. Check \(#file)\(#line)") ; completion(nil) ; return }
            
            do {
                
                if let topLevelDictionary = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any] {
                    let photo = Photo(photoDictionary: topLevelDictionary)
                    completion(photo)
                }
            } catch {
                
                print(error.localizedDescription)
                completion(nil) ; return
            }
        } .resume()
    }
}
