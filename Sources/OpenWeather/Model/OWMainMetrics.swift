//
//  OWMainMetrics.swift
//  
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

struct OWMainMetrics: Codable {

    /// Current temperature.
    ///
    /// Units:
    /// - Default: Kelvin
    /// - Metric: Celcius
    /// - Imperial: Fahrenheit
    let temperature: Double
    
    /// Feels like temperature.
    ///
    /// Units:
    /// - Default: Kelvin
    /// - Metric: Celcius
    /// - Imperial: Fahrenheit
    var feelsLike: Double?
    
    /// Minimum temperature at the moment. This is minimal currently observed temperature (within large megalopolises and urban areas).
    ///
    /// Units:
    /// - Default: Kelvin
    /// - Metric: Celcius
    /// - Imperial: Fahrenheit
    var tempMin: Double?
    
    /// Maximum temperature at the moment. This is maximal currently observed temperature (within large megalopolises and urban areas).
    ///
    /// Units:
    /// - Default: Kelvin
    /// - Metric: Celcius
    /// - Imperial: Fahrenheit
    var tempMax: Double?
    
    /// Humidity.
    ///
    /// Unit: %
    var humidity: Int?
    
    /// Atmospheric pressure on the sea level (if there is no or grnd_level data).
    ///
    /// Unit: hPa
    var pressure: Double?
    
    /// Atmospheric pressure on the sea level.
    ///
    /// Unit: hPa
    var seaLevelPressure: Int?
    
    /// Atmospheric pressure on the ground level.
    ///
    /// Unit: hPa
    var groundLevelPressure: Int?

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevelPressure = "sea_level"
        case groundLevelPressure = "grnd_level"
    }
}
