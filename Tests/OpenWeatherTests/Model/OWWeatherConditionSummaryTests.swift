//
//  OWWeatherConditionSummaryTests.swift
//  
//
//  Created by Adil Erchouk on 11/5/22.
//

import XCTest
@testable import OpenWeather

final class OWWeatherConditionSummaryTests: XCTestCase {

    func testSummaryData() throws {
        guard let summary = OWResponsesMock.simpleWeatherResponseLondonObject.summaries.first else { return }
        
        XCTAssertEqual(summary.id, .brokenClouds)
    }
    
    func testIconSystemName() {
        for key in OWWeatherConditionKey.allCases {
            let daySummary = OWWeatherConditionSummary(id: key,
                                                                               main: "",
                                                                               description: "",
                                                                               iconID: .clearSkyDay)
            let nightSummary = OWWeatherConditionSummary(id: key,
                                                        main: "",
                                                        description: "",
                                                        iconID: .clearSkyNight)
            
            switch key {
            case .thunderstormWithLightRain, .thunderstormWithRain, .thunderstormWitHeavyRain,
              .thunderstormWithLightDrizzle, .thunderstormWithDrizzle, .thunderstormWithHeavyDrizzle:
                XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.thunderstormRain.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.thunderstormRain.accessibilityDescription)
            case .lightThunderstorm, .thunderstorm, .heavyThunderstorm, .raggedThunderstorm:
               XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.thunderstormRain.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.thunderstormRain.accessibilityDescription)
            case .lightIntensityDrizzle, .drizzle, .heavyIntensityDrizzle, .lightIntensityDrizzleRain,
              .drizzleRain, .heavyIntensityDrizzleRain, .showerRainAndDrizzle, .heavyShowerRainAndDrizzle,
              .showerDrizzle:
                 XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.drizzle.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.drizzle.accessibilityDescription)
            case .lightRain, .moderateRain, .freezingRain, .lightIntensityShowerRain, .showerRain:
                 XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.rain.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.rain.accessibilityDescription)
            case .heavyIntensityRain, .veryHeavyRain, .extremeRain, .heavyIntensityShowerRain,
              .raggedShowerRain:
                 XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.heavyRain.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.heavyRain.accessibilityDescription)
            case .lightSnow, .snow, .heavySnow, .lightShowerSnow, .showerSnow, .heavyShowerSnow:
                 XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.snow.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.snow.accessibilityDescription)
            case .sleet, .lightShowerSleet, .showerSleet, .lightRainAndSnow, .rainAndSnow:
                 XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.sleet.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.sleet.accessibilityDescription)
            case .mist, .haze, .fog, .smoke:
                XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.hazeDay.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.hazeDay.accessibilityDescription)
                
                XCTAssertEqual(nightSummary.weatherIconSystemName, OWIconStore.hazeNight.systemName)
                XCTAssertEqual(nightSummary.weatherIconAccessibilityDescription, OWIconStore.hazeNight.accessibilityDescription)
            case .sandDustWhirls, .sand, .dust, .volcanicAsh:
                 XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.dust.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.dust.accessibilityDescription)
            case .squalls:
                 XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.squalls.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.squalls.accessibilityDescription)
            case .tornado:
                 XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.tornado.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.tornado.accessibilityDescription)
            case .clearSky:
                XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.clearSkyDay.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.clearSkyDay.accessibilityDescription)
                
                XCTAssertEqual(nightSummary.weatherIconSystemName, OWIconStore.clearSkyNight.systemName)
                XCTAssertEqual(nightSummary.weatherIconAccessibilityDescription, OWIconStore.clearSkyNight.accessibilityDescription)
            case .fewClouds, .scatteredClouds:
                XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.fewCloudsDay.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.fewCloudsDay.accessibilityDescription)
                
                XCTAssertEqual(nightSummary.weatherIconSystemName, OWIconStore.fewCloudsNight.systemName)
                XCTAssertEqual(nightSummary.weatherIconAccessibilityDescription, OWIconStore.fewCloudsNight.accessibilityDescription)
            case .brokenClouds, .overcastClouds:
                 XCTAssertEqual(daySummary.weatherIconSystemName, OWIconStore.clouds.systemName)
                XCTAssertEqual(daySummary.weatherIconAccessibilityDescription, OWIconStore.clouds.accessibilityDescription)
            }
        }
    }

}
