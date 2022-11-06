//
//  OWWeatherConditionSummaryTests.swift
//  
//
//  Created by Adil Erchouk on 11/5/22.
//

import XCTest
@testable import OpenWeather

final class OWWeatherConditionSummaryTests: XCTestCase {

    func testExample() throws {
        guard let summary = OWResponsesMock.simpleWeatherResponseLondonObject.summaries.first else { return }
        
        XCTAssertEqual(summary.id, .brokenClouds)
        // Make sure the right icon is computed.
        #if canImport(AppKit)
        let expectedIcon = NSImage(systemSymbolName: "smoke.fill", accessibilityDescription: "Clouds")?.withSymbolConfiguration(.preferringMulticolor())
        
        try XCTAssertEqual(summary.weatherIcon.tiffRepresentation, expectedIcon?.tiffRepresentation)
        #elseif canImport(UIKit)
        let expectedIcon = UIImage(systemName: "smoke.fill")?.applyingSymbolConfiguration(.preferringMulticolor())
        
        try XCTAssertEqual(summary.weatherIcon, expectedIcon)
        #endif
    }

}
