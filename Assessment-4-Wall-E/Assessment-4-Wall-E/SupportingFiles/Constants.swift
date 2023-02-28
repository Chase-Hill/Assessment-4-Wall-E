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
