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
        await provider.updateJSONResponse(with: OWResponsesMock.simpleWeatherResponseInvalid401)
        
        do {
            let weather = try await provider.weather(coordinates: .init(latitude: 0, longitude: 0))
            
            XCTAssertEqual(weather.responseCode, 401)
        } catch {
            guard let error = error as? OWError else {
                XCTFail()
                return
            }
            XCTAssertEqual(error.localizedDescription, OWError.invalidAPIKey.localizedDescription)
            XCTAssertEqual(error.recoverySuggestion, OWError.invalidAPIKey.recoverySuggestion)
        }
        
        await provider.updateJSONResponse(with: OWResponsesMock.simpleWeatherResponseInvalid204)
        
        do {
            let weather = try await provider.weather(coordinates: .init(latitude: 0, longitude: 0))
            
            XCTAssertEqual(weather.responseCode, 204)
        } catch {
            guard let error = error as? OWError else {
                XCTFail()
                return
            }
            XCTAssertEqual(error.localizedDescription, OWError.noContent.localizedDescription)
            XCTAssertEqual(error.recoverySuggestion, OWError.noContent.recoverySuggestion)
        }
        
        await provider.updateJSONResponse(with: OWResponsesMock.simpleWeatherResponseInvalid404)
        
        do {
            let weather = try await provider.weather(coordinates: .init(latitude: 0, longitude: 0))
            
            XCTAssertEqual(weather.responseCode, 404)
        } catch {
            guard let error = error as? OWError else {
                XCTFail()
                return
            }
            XCTAssertEqual(error.localizedDescription, OWError.notFound.localizedDescription)
            XCTAssertEqual(error.recoverySuggestion, OWError.notFound.recoverySuggestion)
        }
        
        await provider.updateJSONResponse(with: OWResponsesMock.simpleWeatherResponseInvalid429)
        
        do {
            let weather = try await provider.weather(coordinates: .init(latitude: 0, longitude: 0))
            
            XCTAssertEqual(weather.responseCode, 429)
        } catch {
            guard let error = error as? OWError else {
                XCTFail()
                return
            }
            XCTAssertEqual(error.localizedDescription, OWError.tooManyRequests.localizedDescription)
            XCTAssertEqual(error.recoverySuggestion, OWError.tooManyRequests.recoverySuggestion)
        }
        
        await provider.updateJSONResponse(with: OWResponsesMock.simpleWeatherResponseInvalid500)
        
        do {
            let weather = try await provider.weather(coordinates: .init(latitude: 0, longitude: 0))
            
            XCTAssertEqual(weather.responseCode, 500)
        } catch {
            guard let error = error as? OWError else {
                XCTFail()
                return
            }
            XCTAssertEqual(error.localizedDescription, OWError.unknown(code: 500, message: "Server returned error.").localizedDescription)
            XCTAssertEqual(error.recoverySuggestion, OWError.unknown(code: 500, message: "Server returned error.").recoverySuggestion)
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
