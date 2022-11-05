//
//  OWContext.swift
//  
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

struct OWContext: Codable {
    
    /// ISO 3166 country codes (GB, JP etc.).
    let country: String
    
    /// Sunrise time.
    let sunrise: Date
    
    /// Sunset time.
    let sunset: Date
}
