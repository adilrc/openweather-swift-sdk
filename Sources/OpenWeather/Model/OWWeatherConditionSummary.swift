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
  public var weatherIcon: OWIcon {
    get throws {
      try OWIcon.multiColorSystemSymbol(weatherIconSystemName) ??  { throw OWError.noIconFound }()
    }
  }
  
  public var weatherIconSystemName: String {
    get throws {
      switch id {
      case .thunderstormWithLightRain, .thunderstormWithRain, .thunderstormWitHeavyRain,
        .thunderstormWithLightDrizzle, .thunderstormWithDrizzle, .thunderstormWithHeavyDrizzle:
        return OWIconStore.thunderstormRain.systemName
      case .lightThunderstorm, .thunderstorm, .heavyThunderstorm, .raggedThunderstorm:
        return OWIconStore.thunderstormRain.systemName
      case .lightIntensityDrizzle, .drizzle, .heavyIntensityDrizzle, .lightIntensityDrizzleRain,
        .drizzleRain, .heavyIntensityDrizzleRain, .showerRainAndDrizzle, .heavyShowerRainAndDrizzle,
        .showerDrizzle:
        return OWIconStore.drizzle.systemName
      case .lightRain, .moderateRain, .freezingRain, .lightIntensityShowerRain, .showerRain:
        return OWIconStore.rain.systemName
      case .heavyIntensityRain, .veryHeavyRain, .extremeRain, .heavyIntensityShowerRain,
        .raggedShowerRain:
        return OWIconStore.heavyRain.systemName
      case .lightSnow, .snow, .heavySnow, .lightShowerSnow, .showerSnow, .heavyShowerSnow:
        return OWIconStore.snow.systemName
      case .sleet, .lightShowerSleet, .showerSleet, .lightRainAndSnow, .rainAndSnow:
        return OWIconStore.sleet.systemName
      case .mist, .haze, .fog, .smoke:
        return iconID.isDayIcon ? OWIconStore.hazeDay.systemName : OWIconStore.hazeNight.systemName
      case .sandDustWhirls, .sand, .dust, .volcanicAsh:
        return OWIconStore.dust.systemName
      case .squalls:
        return OWIconStore.squalls.systemName
      case .tornado:
        return OWIconStore.tornado.systemName
      case .clearSky:
        return iconID.isDayIcon ? OWIconStore.clearSkyDay.systemName : OWIconStore.clearSkyNight.systemName
      case .fewClouds, .scatteredClouds:
        return iconID.isDayIcon ? OWIconStore.fewCloudsDay.systemName : OWIconStore.fewCloudsNight.systemName
      case .brokenClouds, .overcastClouds:
        return OWIconStore.clouds.systemName
      }
    }
  }
}
