//
//  OWIconStore.swift
//
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation

enum OWIconStore {
    /// 􀇓 Thunderstorm
    case thunderstorm

    /// 􀇟 Thunderstorm Rain
    case thunderstormRain

    /// 􀇅 Drizzle
    case drizzle

    /// 􀇇 Rain
    case rain

    /// 􀇉 Heavy rain
    case heavyRain

    /// 􀇏 Snow
    case snow

    /// 􀇑 Sleet
    case sleet

    /// 􀆸 Haze day
    case hazeDay

    /// 􁑰 Haze night
    case hazeNight

    /// 􀇋 Clouds fog
    case fog

    /// 􀆶 Dust
    case dust

    /// 􀇣 Smoke
    case clouds

    /// 􀇤 Wind
    case squalls

    /// 􀇧 Tornado
    case tornado

    /// 􀆮 Clear sky day
    case clearSkyDay

    /// 􀆺 Clear sky night
    case clearSkyNight

    /// 􀇕 Few clouds day
    case fewCloudsDay

    /// 􀇛 Few clouds night
    case fewCloudsNight

    var accessibilityDescription: String {
        switch self {
            case .thunderstorm:
                return "Thunderstorm"
            case .thunderstormRain:
                return "Thunderstorm Rain"
            case .drizzle:
                return "Drizzle"
            case .rain:
                return "Rain"
            case .heavyRain:
                return "Heavy Rain"
            case .snow:
                return "Snow"
            case .sleet:
                return "Sleet"
            case .hazeDay, .hazeNight:
                return "Haze"
            case .fog:
                return "Fog"
            case .dust:
                return "Dust"
            case .clouds:
                return "Clouds"
            case .squalls:
                return "Wind"
            case .tornado:
                return "Tornado"
            case .clearSkyDay, .clearSkyNight:
                return "Clear Sky"
            case .fewCloudsDay, .fewCloudsNight:
                return "Few Clouds"
        }
    }

    var systemName: String {
        switch self {
            case .thunderstorm:
                return "cloud.bolt.fill"
            case .thunderstormRain:
                return "cloud.bolt.rain.fill"
            case .drizzle:
                return "cloud.drizzle.fill"
            case .rain:
                return "cloud.rain.fill"
            case .heavyRain:
                return "cloud.heavyrain.fill"
            case .snow:
                return "cloud.snow.fill"
            case .sleet:
                return "cloud.hail.fill"
            case .hazeDay:
                return "sun.haze.fill"
            case .hazeNight:
                return "moon.haze.fill"
            case .fog:
                return "cloud.fog.fill"
            case .dust:
                return "sun.dust"
            case .clouds:
                return "smoke.fill"
            case .squalls:
                return "wind"
            case .tornado:
                return "tornado"
            case .clearSkyDay:
                return "sun.max.fill"
            case .clearSkyNight:
                return "moon.fill"
            case .fewCloudsDay:
                return "cloud.sun.fill"
            case .fewCloudsNight:
                return "cloud.moon.fill"
        }
    }
}
