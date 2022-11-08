//
//  OWRequestPerformingMock.swift
//  
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation
@testable import OpenWeather

actor OWRequestPerformerMock: OWRequestPerforming {
    enum Mode {
        case weather
        case bulkWeather
        case directGeocoding
    }
    
    private var mode: Mode = .weather
    
    func setMode(_ mode: Mode) {
        self.mode = mode
    }
    
    func perform<Object>(_ request: URLRequest, urlSession: URLSession = URLSession.shared) async throws -> Object where Object : Decodable {
        switch mode {
        case .weather:
            return OWResponsesMock.simpleWeatherResponseLondonObject as! Object
        case .bulkWeather:
            return OWResponsesMock.bulkWeatherResponseLondonObject as! Object
        case .directGeocoding:
            return OWResponsesMock.directGeocodingResponseParisObject as! Object
        }
    }
}
