//
//  OWGeocodingResponse.swift
//  
//
//  Created by Adil Erchouk on 11/6/22.
//

import Foundation

public struct OWGeocodingResponse: Codable {
  public let name: String
  public let latitude: Double
  public let longitude: Double
  public let countryCode: String
  public var state: String?
  
  enum CodingKeys: String, CodingKey {
    case name, state
    case latitude = "lat"
    case longitude = "lon"
    case countryCode = "country"
  }
}
