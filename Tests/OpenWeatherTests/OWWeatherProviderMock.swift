//
//  OWWeatherProviderMock.swift
//  
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation
import OpenWeather

actor OWWeatherProviderMock: OWWeatherProvider {
    /// The expected JSON response in String format.
    private var jsonString: String = ""
    
    func updateJSONResponse(with string: String) {
        jsonString = string
    }
    
    func weather(coordinates: OWCoordinates) throws -> OWSimpleWeatherResponse {
        do {
            let data = jsonString.data(using: .utf8) ?? { fatalError("JSON string cannot be encoded to Data.") }()
            let decoder = JSONDecoder()
            return try decoder.decode(OWSimpleWeatherResponse.self, from: data)
        } catch {
            switch error {
            case let DecodingError.dataCorrupted(context):
                logger.error("\(context.debugDescription)")
            case let DecodingError.keyNotFound(key, context):
                logger.error("Key '\(key.debugDescription)' not found: \(context.debugDescription)")
            case let DecodingError.valueNotFound(value, context):
                logger.error("Value '\(value)' not found: \(context.debugDescription)")
            case let DecodingError.typeMismatch(type, context) :
                logger.error("Type '\(type)' mismatch: \(context.debugDescription)\n\(context.codingPath.debugDescription)")
            default:
                logger.error("\(error.localizedDescription)")
                throw error
            }
            throw error
        }
    }
    
    func fiveDayforecast(coordinates: OWCoordinates) async throws -> OWBulkWeatherResponse {
        do {
            let data = jsonString.data(using: .utf8) ?? { fatalError("JSON string cannot be encoded to Data.") }()
            let decoder = JSONDecoder()
            return try decoder.decode(OWBulkWeatherResponse.self, from: data)
        } catch {
            switch error {
            case let DecodingError.dataCorrupted(context):
                logger.error("\(context.debugDescription)")
            case let DecodingError.keyNotFound(key, context):
                logger.error("Key '\(key.debugDescription)' not found: \(context.debugDescription)")
            case let DecodingError.valueNotFound(value, context):
                logger.error("Value '\(value)' not found: \(context.debugDescription)")
            case let DecodingError.typeMismatch(type, context) :
                logger.error("Type '\(type)' mismatch: \(context.debugDescription)\n\(context.codingPath.debugDescription)")
            default:
                logger.error("\(error.localizedDescription)")
                throw error
            }
            throw error
        }
    }
}
