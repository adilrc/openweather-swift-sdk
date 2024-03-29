//
//  File.swift
//
//
//  Created by Adil Erchouk on 11/6/22.
//

import Foundation

public protocol OWGeocoding {
    func directGeocoding(_ locationName: String) async throws -> [OWGeocodingResponse]
}
