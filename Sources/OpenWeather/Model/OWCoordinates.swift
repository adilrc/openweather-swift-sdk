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

  public init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
  
  enum CodingKeys: String, CodingKey {
    case latitude = "lat"
    case longitude = "lon"
  }
}
