//
//  OWRain.swift
//
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

public struct OWRain: Codable {

    /// Rain volume for the last hour
    ///
    /// Unit: mm
    public let lastHourVolume: Double

    /// Rain volume for the last 3 hours
    ///
    /// Unit: mm
    public let lastThreeHourVolume: Double

    enum CodingKeys: String, CodingKey {
        case lastHourVolume = "1h"
        case lastThreeHourVolume = "3h"
    }
}
