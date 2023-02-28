//
//  Photo.swift
//  Assessment-4-Wall-E
//
//  Created by Chase on 2/27/23.
//

import Foundation

class Photo {
    
    let cameraName: String
    let date: String
    let imageString: String
    
    init(cameraName: String, date: String, imageString: String) {
        self.cameraName = cameraName
        self.date = date
        self.imageString = imageString
    }
} // End of class

// MARK: - Extension and Convenience Initializer
extension Photo {
    
    enum Keys: String {
        case date = "earth_date"
        case imageString = "img_src"
        case cameraName = "full_name"
        case camera
    }
    
    convenience init?(photoDictionary: [String : Any]) {
        guard let date = photoDictionary[Keys.date.rawValue] as? String,
              let imageString = photoDictionary[Keys.imageString.rawValue] as? String,
              let cameraDictionary = photoDictionary[Keys.camera.rawValue] as? [String : Any],
              let cameraName = cameraDictionary[Keys.cameraName.rawValue] as? String else { return nil }
        
        self.init(cameraName: cameraName, date: date, imageString: imageString)
    }
}
