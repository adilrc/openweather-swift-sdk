//
//  OWIconKeyTests.swift
//  
//
//  Created by Adil Erchouk on 11/5/22.
//

import XCTest
@testable import OpenWeather

final class OWIconKeyTests: XCTestCase {

    func testDayIcon() throws {
        let dayIcon = OWIconKey.clearSkyDay
        let nightIcon = OWIconKey.clearSkyNight
        
        XCTAssertTrue(dayIcon.isDayIcon)
        XCTAssertFalse(nightIcon.isDayIcon)
    }
}
