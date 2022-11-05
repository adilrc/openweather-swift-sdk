//
//  OWRequestHandlerTest.swift
//  
//
//  Created by Adil Erchouk on 11/5/22.
//

import XCTest
@testable import OpenWeather

final class OWRequestHandlerTest: XCTestCase {

    let requestHandler = OWRequestHandler()

    func testExample() async throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        let urlSession = URLSession.init(configuration: configuration)
        
        let request = URLRequest(url: try! OWURL.weather(configuration: .init(token: "", coordinates: .init(latitude: 0, longitude: 0))).url)
        
        URLProtocolMock.requestHandler = { request in
            guard let url = request.url  else { throw URLError(.badURL) }
            
            let data = OWResponsesMock.simpleWeatherResponseLondon.data(using: .utf8)
            
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        let weather: OWSimpleWeatherResponse = try await requestHandler.perform(request, urlSession: urlSession)
        
        XCTAssertEqual(weather.responseCode, 200)
    }
}
