//
//  OpenWeather.swift
//
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

public actor OpenWeather {
    private var requestHandler: OWRequestPerforming = OWRequestHandler.shared
    private let token: String

    public init(token: String) {
        self.token = token
    }

    func setRequestHandler(_ requestHandler: OWRequestPerforming) {
        self.requestHandler = requestHandler
    }
}

extension OpenWeather: OWWeatherProvider {
    /// Provides the weather for the specified location.
    /// - Parameter coordinates:  Coordinates of the requested location's forecast.
    /// - Returns: A container with weather data.
    public func weather(coordinates: OWCoordinates) async throws -> OWSimpleWeatherResponse {
        logger.info(
            "Weather requested for coordinates: \(coordinates.latitude), \(coordinates.longitude).")

        let urlConfiguration = OWURLConfiguration(token: token, coordinates: coordinates, unitType: "metric")
        let url = try OWURL.weather(configuration: urlConfiguration).url
        let urlRequest = URLRequest(url: url)

        return try await requestHandler.perform(urlRequest, urlSession: URLSession.shared)
    }

    /// Provides a five days forecast for the specified location with details every 3 hours.
    /// - Parameter coordinates: Coordinates of the requested location's forecast.
    /// - Returns: A container with a list of simple weather response (one response for every 3 hours, up to 40).
    public func fiveDayforecast(coordinates: OWCoordinates) async throws -> OWBulkWeatherResponse {
        logger.info(
            "Five day forecast requested for coordinates: \(coordinates.latitude), \(coordinates.longitude)."
        )

        let urlConfiguration = OWURLConfiguration(token: token, coordinates: coordinates, unitType: "metric")
        let url = try OWURL.forecast(configuration: urlConfiguration).url
        let urlRequest = URLRequest(url: url)

        return try await requestHandler.perform(urlRequest, urlSession: URLSession.shared)
    }
}

extension OpenWeather: OWGeocoding {
    ///Direct geocoding allows to get geographical coordinates by using name of the location (city name or area name).
    public func directGeocoding(_ locationName: String) async throws -> [OWGeocodingResponse] {
        logger.info(
            "Geocoding requested for search input: \(locationName)"
        )

        let urlConfiguration = OWURLConfiguration(token: token, locationName: locationName)
        let url = try OWURL.directGeocoding(configuration: urlConfiguration).url
        let urlRequest = URLRequest(url: url)

        return try await requestHandler.perform(urlRequest, urlSession: URLSession.shared)
    }
}
