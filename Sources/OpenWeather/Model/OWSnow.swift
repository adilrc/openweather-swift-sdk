//
//  OWSnow.swift
//  
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

struct OWSnow: Codable {

    /// Snow volume for the last hour
    ///
    /// Unit: mm
    var lastHourVolume: Double?
    
    /// Snow volume for the last 3 hours
    ///
    /// Unit: mm
    var lastThreeHourVolume: Double?

    enum CodingKeys: String, CodingKey {
        case lastHourVolume = "1h"
        case lastThreeHourVolume = "3h"
    }
}
