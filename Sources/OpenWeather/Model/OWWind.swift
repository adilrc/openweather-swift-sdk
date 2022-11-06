//
//  OWWind.swift
//
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

public struct OWWind: Codable {

  /// The wind speed.
  ///
  /// Units:
  /// - Default: meter/sec
  /// - Metric: meter/sec
  /// - Imperial: miles/hour
  public var speed: Double?

  /// The wind direction.
  ///
  /// Unit: degrees
  public var direction: Int?

  /// The wind gust.
  ///
  /// Units:
  /// - Default: meter/sec
  /// - Metric: meter/sec
  /// - Imperial: miles/hour
  public var gust: Double?

  enum CodingKeys: String, CodingKey {
    case speed, gust
    case direction = "deg"
  }
}
