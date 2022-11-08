//
//  OWURL.swift
//
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation

struct OWURLConfiguration {
    let token: String
    var coordinates: OWCoordinates?
    var unitType: String?
    var locationName: String?

    init(token: String, coordinates: OWCoordinates? = nil, unitType: String? = nil, locationName: String? = nil) {
        self.token = token
        self.coordinates = coordinates
        self.unitType = unitType
        self.locationName = locationName
    }

    fileprivate var queryItems: [URLQueryItem] {
        var queryItems =
            [
                URLQueryItem(name: "appid", value: token)
            ]

        if let coordinates {
            queryItems.append(contentsOf: [
                URLQueryItem(name: "lat", value: "\(coordinates.latitude)"),
                URLQueryItem(name: "lon", value: "\(coordinates.longitude)"),
            ])
        }

        if let unitType {
            queryItems.append(URLQueryItem(name: "units", value: unitType))
        }

        if let locationName {
            queryItems.append(contentsOf: [
                .init(name: "q", value: locationName),
                .init(name: "limit", value: "5"),
            ])
        }

        return queryItems
    }
}

enum OWURL {

    private static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5")
    private static let geoURL = URL(string: "https://api.openweathermap.org/geo/1.0")

    /// https://api.openweathermap.org/data/2.5/weather?appid={{api_key}}&units=metric&lat=18.015484&lon=13.216523
    case weather(configuration: OWURLConfiguration)
    /// https://api.openweathermap.org/data/2.5/forecast?lat={{lat_london}}&lon={{long_london}}&appid={{api_key}}
    case forecast(configuration: OWURLConfiguration)

    case directGeocoding(configuration: OWURLConfiguration)

    var url: URL {
        get throws {
            var urlComponents: URLComponents
            let queryItems: [URLQueryItem]

            switch self {
                case let .weather(configuration):
                    guard
                        let baseURL = Self.baseURL,
                        let urlComps = URLComponents(
                            url: baseURL.appendingPathComponent("weather"), resolvingAgainstBaseURL: false)
                    else { throw URLError(.badURL) }
                    queryItems = configuration.queryItems
                    urlComponents = urlComps
                case let .forecast(configuration):
                    guard
                        let baseURL = Self.baseURL,
                        let urlComps = URLComponents(
                            url: baseURL.appendingPathComponent("forecast"), resolvingAgainstBaseURL: false)
                    else { throw URLError(.badURL) }
                    queryItems = configuration.queryItems
                    urlComponents = urlComps
                case let .directGeocoding(configuration):
                    guard
                        let geoURL = Self.geoURL,
                        let urlComps = URLComponents(
                            url: geoURL.appendingPathComponent("direct"), resolvingAgainstBaseURL: false)
                    else { throw URLError(.badURL) }
                    queryItems = configuration.queryItems
                    urlComponents = urlComps
            }

            urlComponents.queryItems = queryItems
            guard let url = urlComponents.url else { throw URLError(.badURL) }
            return url
        }
    }
}
