//
//  Constants.swift
//  Assessment-4-Wall-E
//
//  Created by Chase on 2/27/23.
//

import Foundation

struct Constants {
    
    struct NASAURL {
    //https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=6FWUge4KKZMAWtAY8KrBypHzHiPnQMitR3EhbTRX&earth_date=2015-6-3
        static let baseURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos"
        static let queryKey = "api_key"
        static let queryValue = "6FWUge4KKZMAWtAY8KrBypHzHiPnQMitR3EhbTRX"
        static let dateKey = "earth_date"
    }
}

enum NetworkError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Check URL Endpoint."
        case .thrownError(let error):
            return "Thrown Error: \(error.localizedDescription)"
        case .noData:
            return "No Data Was Recieved From Network Fetch. Please Try Again Later."
        case .unableToDecode:
            return "Unable To Decode The Data From Network. Please Try Again Later."
        }
    }
}

