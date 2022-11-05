//
//  OWError.swift
//  
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

enum OWError: LocalizedError {

    /// Custom error if the Open Weather API doesn't provide basic weather data for a given location.
    /// This error can be represented by error code 204.
    case noContent
    
    /// You can get the error 401 in the following cases:
    /// - You did not specify your API key in API request.
    /// - Your API key is not activated yet. Within the next couple of hours, it will be activated and ready to use.
    /// - You are using wrong API key in API request. Please, check your right API key in personal account.
    /// - You are using a Free subscription and try requesting data available in other subscriptions . For example, 16 days/daily forecast API, any historical weather data, Weather maps 2.0, etc). Please, check your subscription in your personal account.
    case invalidAPIKey
    
    /// You can  get the error 404 if the format of your API request is incorrect. In this case, please review it and check for any mistakes.
    /// To see examples of correct API requests, please visit the Documentation (https://docs.openweather.co.uk/api) of a specific API and read the examples of API calls there.
    case notFound
    
    /// You will get the error 429 if you are a user of a Free subscription and make more than 60 API calls per minute (surpassing the limit of your subscription).
    /// Please consider upgrading to a subscription plan that meets your needs or reduce the number of API calls in accordance with the limits.
    case tooManyRequests
    
    /// In case you receive one of the following errors 500, 502, 503 or 504 please contact us for assistance.
    case unknown(code: Int, message: String?)
    
    init(errorCode: Int, message: String? = nil) {
        switch errorCode {
        case 204:
            self = .noContent
        case 401:
            self = .invalidAPIKey
        case 404:
            self = .notFound
        case 429:
            self = .tooManyRequests
        default:
            self = .unknown(code: errorCode, message: message)
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .noContent:
            return "The API returned successfully but no weather data was returned for the request."
        case .invalidAPIKey:
            return "The provided API key is invalid or unactivated."
        case .notFound:
            return "The requested ressource was not found."
        case .tooManyRequests:
            return "The number of requests is over the limits of your subscription."
        case let .unknown(code, message):
            return "Error code \(code): \(message ?? "Unknown Error")"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .noContent:
            return "Please make sure the requested location is accurate."
        case .invalidAPIKey:
            return "Please make sure you entered the right API key in the request and that the key is valid and activated."
        case .notFound:
            return "Please make sure the format of the API request is valid."
        case .tooManyRequests:
            return "Please consider upgrading to a subscription plan that meets your needs or reduce the number of API calls in accordance with the limits."
        case .unknown:
            return "Please contact OpenWeather for assistance. Please enclose an example of your API request that receives this error into your email."
        }
    }
}
