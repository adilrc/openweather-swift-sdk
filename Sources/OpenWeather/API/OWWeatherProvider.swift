//
//  OWWeatherProvider.swift
//
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation

public protocol OWWeatherProvider {
  func weather(coordinates: OWCoordinates) async throws -> OWSimpleWeatherResponse
  func fiveDayforecast(coordinates: OWCoordinates) async throws -> OWBulkWeatherResponse
}
