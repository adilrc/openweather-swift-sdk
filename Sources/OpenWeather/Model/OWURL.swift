//
//  OWURL.swift
//  
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation

struct OWURLConfiguration {
    let token: String
    let coordinates: OWCoordinates
    let unitType = "metric"
    
    init(token: String, coordinates: OWCoordinates) {
        self.token = token
        self.coordinates = coordinates
    }
    
    fileprivate var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "appid", value: token),
            URLQueryItem(name: "units", value: unitType),
            URLQueryItem(name: "lat", value: "\(coordinates.latitude)"),
            URLQueryItem(name: "lon", value: "\(coordinates.longitude)"),
        ]
    }
}

enum OWURL {

    private static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5")
    
    /// https://api.openweathermap.org/data/2.5/weather?appid={{api_key}}&units=metric&lat=18.015484&lon=13.216523
    case weather(configuration: OWURLConfiguration)
    /// https://api.openweathermap.org/data/2.5/forecast?lat={{lat_london}}&lon={{long_london}}&appid={{api_key}}
    case forecast(configuration: OWURLConfiguration)
    
    var url: URL {
        get throws {
            guard let baseURL = Self.baseURL else { throw URLError(.badURL) }
        
            var urlComponents: URLComponents
            let queryItems: [URLQueryItem]

            switch self {
            case let .weather(configuration):
                guard let urlComps = URLComponents(url: baseURL.appendingPathComponent("weather"), resolvingAgainstBaseURL: false) else { throw URLError(.badURL) }
                queryItems = configuration.queryItems
                urlComponents = urlComps
            case let .forecast(configuration):
                guard let urlComps = URLComponents(url: baseURL.appendingPathComponent("forecast"), resolvingAgainstBaseURL: false) else { throw URLError(.badURL) }
                queryItems = configuration.queryItems
                urlComponents = urlComps
            }
            
            urlComponents.queryItems = queryItems
            guard let url = urlComponents.url else { throw URLError(.badURL) }
            return url
        }
    }
}
