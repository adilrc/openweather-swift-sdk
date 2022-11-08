//
//  OWWeatherConditionSummary.swift
//
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

public struct OWWeatherConditionSummary: Codable {
    
    /// The weather condition ID.
    public let id: OWWeatherConditionKey
    
    /// Group of weather parameters (Rain, Snow, Extreme etc.).
    public let main: String
    
    /// The weather description.
    public let description: String
    
    /// The weather icon ID.
    public let iconID: OWIconKey
    
    enum CodingKeys: String, CodingKey {
        case id, main, description
        case iconID = "icon"
    }
}

extension OWWeatherConditionSummary: OWIconProvider {
    private var icon: OWIconStore {
        switch id {
        case .thunderstormWithLightRain, .thunderstormWithRain, .thunderstormWitHeavyRain,
                .thunderstormWithLightDrizzle, .thunderstormWithDrizzle, .thunderstormWithHeavyDrizzle:
            return OWIconStore.thunderstormRain
        case .lightThunderstorm, .thunderstorm, .heavyThunderstorm, .raggedThunderstorm:
            return OWIconStore.thunderstormRain
        case .lightIntensityDrizzle, .drizzle, .heavyIntensityDrizzle, .lightIntensityDrizzleRain,
                .drizzleRain, .heavyIntensityDrizzleRain, .showerRainAndDrizzle, .heavyShowerRainAndDrizzle,
                .showerDrizzle:
            return OWIconStore.drizzle
        case .lightRain, .moderateRain, .freezingRain, .lightIntensityShowerRain, .showerRain:
            return OWIconStore.rain
        case .heavyIntensityRain, .veryHeavyRain, .extremeRain, .heavyIntensityShowerRain,
                .raggedShowerRain:
            return OWIconStore.heavyRain
        case .lightSnow, .snow, .heavySnow, .lightShowerSnow, .showerSnow, .heavyShowerSnow:
            return OWIconStore.snow
        case .sleet, .lightShowerSleet, .showerSleet, .lightRainAndSnow, .rainAndSnow:
            return OWIconStore.sleet
        case .mist, .haze, .fog, .smoke:
            return iconID.isDayIcon ? OWIconStore.hazeDay : OWIconStore.hazeNight
        case .sandDustWhirls, .sand, .dust, .volcanicAsh:
            return OWIconStore.dust
        case .squalls:
            return OWIconStore.squalls
        case .tornado:
            return OWIconStore.tornado
        case .clearSky:
            return iconID.isDayIcon ? OWIconStore.clearSkyDay : OWIconStore.clearSkyNight
        case .fewClouds, .scatteredClouds:
            return iconID.isDayIcon ? OWIconStore.fewCloudsDay : OWIconStore.fewCloudsNight
        case .brokenClouds, .overcastClouds:
            return OWIconStore.clouds
        }
    }

    public var weatherIconSystemName: String {
        icon.systemName
    }
    
    public var weatherIconAccessibilityDescription: String? {
        icon.accessibilityDescription
    }
}
