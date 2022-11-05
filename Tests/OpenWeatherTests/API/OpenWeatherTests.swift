//
//  OpenWeatherTests.swift
//  
//
//  Created by Adil Erchouk on 11/4/22.
//

import XCTest
@testable import OpenWeather

final class OpenWeatherTests: XCTestCase {

    let openWeather = OpenWeather(token: "token")
    let requestHandler = OWRequestPerformerMock()
    
    override func setUp() async throws {
        await openWeather.setRequestHandler(requestHandler)
    }

   
    func testFetchingWeather() async throws {
        await requestHandler.setMode(.simple)
        
        let weather = try await openWeather.weather(coordinates: .init(latitude: 0, longitude: 0))
        
        XCTAssertEqual(weather.responseCode, 200)
    }
    
    func testFetchingFiveDayForecast() async throws {
        await requestHandler.setMode(.bulk)
        
        let forecast = try await openWeather.fiveDayforecast(coordinates: .init(latitude: 0, longitude: 0))
        
        XCTAssertEqual(forecast.responseCode, "200")
    }
}
