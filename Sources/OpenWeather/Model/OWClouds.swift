//
//  OWClouds.swift
//
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

public struct OWClouds: Codable {

  /// Cloudiness
  /// Unit: %
  public let cloudiness: Int

  enum CodingKeys: String, CodingKey {
    case cloudiness = "all"
  }
}
