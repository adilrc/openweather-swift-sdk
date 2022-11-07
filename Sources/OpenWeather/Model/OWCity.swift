//
//  File.swift
//  
//
//  Created by Adil Erchouk on 11/6/22.
//

import Foundation

public struct OWCity: Codable {
  public var name: String?
  public var country: String?
  public var timeZone: TimeZone?
  public var sunrise: Date?
  public var sunset: Date?
  
  enum CodingKeys: String, CodingKey {
    case name, country, sunrise, sunset
    case timeZone = "timezone"
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try container.decodeIfPresent(String.self, forKey: .name)
    self.country = try container.decodeIfPresent(String.self, forKey: .country)
    let timeZoneShift = try? container.decode(Int.self, forKey: .timeZone)
    self.timeZone = timeZoneShift.flatMap { .init(secondsFromGMT: $0) }
    self.sunrise = try container.decodeIfPresent(Date.self, forKey: .sunrise)
    self.sunset = try container.decodeIfPresent(Date.self, forKey: .sunset)
  }
}
