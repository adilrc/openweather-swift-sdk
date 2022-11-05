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
    public func weather(coordinates: OWCoordinates) async throws -> OWSimpleWeatherResponse {
        let urlConfiguration = OWURLConfiguration(token: token, coordinates: coordinates)
        let url = try OWURL.weather(configuration: urlConfiguration).url
        let urlRequest = URLRequest(url: url)
        
        return try await OWRequestHandler.shared.perform(urlRequest)
    }
}
