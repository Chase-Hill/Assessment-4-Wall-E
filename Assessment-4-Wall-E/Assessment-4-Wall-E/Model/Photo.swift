//
//  Photo.swift
//  Assessment-4-Wall-E
//
//  Created by Chase on 2/27/23.
//

import Foundation

struct Photos: Decodable {
    private enum CodingKeys: String, CodingKey {
        case Photo
        
    }
    
    let Photo: Photo
}

struct Photo: Decodable {
    private enum CodingKeys: String, CodingKey {
        case camera
        case imageString = "img_src"
        case date = "earth_date"
    }
    
    let camera: Camera
    let imageString: String
    let date: String
}

struct Camera: Decodable {
    private enum CodingKeys: String, CodingKey {
        case cameraName = "full_name"
    }
    
    let cameraName: String
}
