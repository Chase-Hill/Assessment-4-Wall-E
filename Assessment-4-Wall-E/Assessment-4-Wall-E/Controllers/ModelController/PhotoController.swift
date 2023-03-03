//
//  PhotoController.swift
//  Assessment-4-Wall-E
//
//  Created by Chase on 2/27/23.
//

import Foundation

struct func fetchPhoto(searchTerm: String, completion: @escaping (Result<Photo, NetworkError>) -> Void) {
    
    guard let baseURL = URL(string: Constants.NASAURL.baseURL) else { completion(.failure(.invalidURL)) ; return }
}
