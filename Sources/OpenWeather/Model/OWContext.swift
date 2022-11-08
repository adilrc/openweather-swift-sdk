//
//  OWContext.swift
//
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

public struct OWContext: Codable {

    /// ISO 3166 country codes (GB, JP etc.).
    public let country: String

    /// Sunrise time.
    public let sunrise: Date

    /// Sunset time.
    public let sunset: Date
}
