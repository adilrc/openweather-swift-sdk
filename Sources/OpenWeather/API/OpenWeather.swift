//
//  OpenWeather.swift
//  
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

public actor OpenWeather {
    private let token: String

    public init(token: String) {
        self.token = token
    }
}

extension OpenWeather: OWWeatherProvider {
    /// Provides the weather for the specified location.
    /// - Parameter coordinates:  Coordinates of the requested location's forecast.
    /// - Returns: A container with weather data.
    public func weather(coordinates: OWCoordinates) async throws -> OWSimpleWeatherResponse {
        let urlConfiguration = OWURLConfiguration(token: token, coordinates: coordinates)
        let url = try OWURL.weather(configuration: urlConfiguration).url
        let urlRequest = URLRequest(url: url)
        
        return try await OWRequestHandler.shared.perform(urlRequest)
    }
    
    /// Provides a five days forecast for the specified location with details every 3 hours.
    /// - Parameter coordinates: Coordinates of the requested location's forecast.
    /// - Returns: A container with a list of simple weather response (one response for every 3 hours, up to 40).
    public func fiveDayforecast(coordinates: OWCoordinates) async throws -> OWBulkWeatherResponse {
        let urlConfiguration = OWURLConfiguration(token: token, coordinates: coordinates)
        let url = try OWURL.forecast(configuration: urlConfiguration).url
        let urlRequest = URLRequest(url: url)
        
        return try await OWRequestHandler.shared.perform(urlRequest)
    }    
}
