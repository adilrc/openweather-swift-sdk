//
//  OpenWeatherSimpleResponseTests.swift
//  
//
//  Created by Adil Erchouk on 11/3/22.
//

import XCTest
@testable import OpenWeather

final class OpenWeatherSimpleResponseTests: XCTestCase {
    let provider = OWWeatherProviderMock()
    
    override func tearDown() async throws {
        await provider.updateJSONResponse(with: "")
    }
    
    func testFetchingSimpleWeatherResponseLondon() async throws {
        await provider.updateJSONResponse(with: OWResponsesMock.simpleWeatherResponseLondon)
        
        let weather = try await provider.weather(coordinates: .init(latitude: 0, longitude: 0))
        
        XCTAssertEqual(weather.responseCode, 200)
        XCTAssertEqual(weather.date, Date(timeIntervalSince1970: 1667529562))
        XCTAssertEqual(weather.timeZone, TimeZone(secondsFromGMT: 0))

        // Check main summary
        XCTAssertEqual(weather.summaries.first?.id, .brokenClouds)
        XCTAssertEqual(weather.summaries.first?.iconID, .brokenCloudsNight)
        XCTAssertEqual(weather.summaries.first?.description, "broken clouds")
        XCTAssertEqual(weather.summaries.first?.main, "Clouds")
        
        // Check main metrics
        XCTAssertEqual(weather.mainMetrics.temperature, 8.24)
        XCTAssertEqual(weather.mainMetrics.feelsLike, 7.6)
        XCTAssertEqual(weather.mainMetrics.tempMin, 6.96)
        XCTAssertEqual(weather.mainMetrics.tempMax, 9.14)
        XCTAssertEqual(weather.mainMetrics.pressure, 1000)
        XCTAssertEqual(weather.mainMetrics.humidity, 95)

        XCTAssertEqual(weather.visibility, 10000)
        XCTAssertEqual(weather.wind?.speed, 1.54)
        XCTAssertEqual(weather.wind?.direction, 10)
        // 75% cloudiness for London seems accurate.
        XCTAssertEqual(weather.clouds?.cloudiness, 75)
    }
    
    func testFetchingSimpleWeatherResponseInvalid() async throws {
        await provider.updateJSONResponse(with: OWResponsesMock.simpleWeatherResponseInvalid)
        
        do {
            let weather = try await provider.weather(coordinates: .init(latitude: 0, longitude: 0))
            
            XCTAssertEqual(weather.responseCode, 401)
        } catch {
            XCTAssertTrue(error is OWError)
            XCTAssertEqual(error.localizedDescription, OWError.invalidAPIKey.localizedDescription)
        }
    }
    
    func testFetchingSimpleWeatherResponseEmpty() async throws {
        await provider.updateJSONResponse(with: OWResponsesMock.simpleWeatherResponseEmpty)
        
        do {
            let weather = try await provider.weather(coordinates: .init(latitude: 0, longitude: 0))
            
            XCTAssertEqual(weather.responseCode, 204)
        } catch {
            XCTAssertTrue(error is OWError)
            XCTAssertEqual(error.localizedDescription, OWError.noContent.localizedDescription)
        }
    }
}
