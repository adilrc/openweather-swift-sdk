//
//  OWRain.swift
//
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

struct OWRain: Codable {

  /// Rain volume for the last hour
  ///
  /// Unit: mm
  let lastHourVolume: Double

  /// Rain volume for the last 3 hours
  ///
  /// Unit: mm
  let lastThreeHourVolume: Double

  enum CodingKeys: String, CodingKey {
    case lastHourVolume = "1h"
    case lastThreeHourVolume = "3h"
  }
}
