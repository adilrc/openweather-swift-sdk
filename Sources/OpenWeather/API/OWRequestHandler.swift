//
//  OWRequestHandler.swift
//  
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation

protocol OWRequestPerforming {
    func perform<Object: Decodable>(_ request: URLRequest, urlSession: URLSession) async throws -> Object
}

actor OWRequestHandler: OWRequestPerforming {
    static let shared = OWRequestHandler()
    
    /// Performs a request and decodes it assuming the response's data has JSON content.
    /// - Parameter request: The input request.
    /// - Returns: An object decoded from a JSON.
    func perform<Object: Decodable>(_ request: URLRequest, urlSession: URLSession = URLSession.shared) async throws -> Object {
        logger.debug("Calling URL: \(request.url!)")
        
        let (data, response) = try await urlSession.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<400).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let jsonDecoder = JSONDecoder()
        let object = try jsonDecoder.decode(Object.self, from: data)
        
        return object
    }
}
