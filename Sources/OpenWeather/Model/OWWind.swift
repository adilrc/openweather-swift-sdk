//
//  OWWind.swift
//  
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

struct OWWind: Codable {

    /// The wind speed.
    /// 
    /// Units:
    /// - Default: meter/sec
    /// - Metric: meter/sec
    /// - Imperial: miles/hour
    var speed: Double?
    
    /// The wind direction.
    ///
    /// Unit: degrees
    var direction: Int?
    
    /// The wind gust.
    ///
    /// Units:
    /// - Default: meter/sec
    /// - Metric: meter/sec
    /// - Imperial: miles/hour
    var gust: Double?
    
    enum CodingKeys: String, CodingKey {
        case speed, gust
        case direction = "deg"
    }
}
