//
//  OWClouds.swift
//
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

struct OWClouds: Codable {

  /// Cloudiness
  /// Unit: %
  let cloudiness: Int

  enum CodingKeys: String, CodingKey {
    case cloudiness = "all"
  }
}
