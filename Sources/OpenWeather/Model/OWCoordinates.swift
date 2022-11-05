//
//  OWCoordinates.swift
//  
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

public struct OWCoordinates: Codable {
    
    /// The geo location latitude.
    public let latitude: Double
    
    /// The geo location longitude
    public let longitude: Double

    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}
