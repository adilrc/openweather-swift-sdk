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
        case simple
        case bulk
    }
    
    private var mode: Mode = .simple
    
    func setMode(_ mode: Mode) {
        self.mode = mode
    }
    
    func perform<Object>(_ request: URLRequest, urlSession: URLSession = URLSession.shared) async throws -> Object where Object : Decodable {
        switch mode {
        case .simple:
            return OWResponsesMock.simpleWeatherResponseLondonObject as! Object
        case .bulk:
            return OWResponsesMock.bulkWeatherResponseLondonObject as! Object
        }
    }
}
