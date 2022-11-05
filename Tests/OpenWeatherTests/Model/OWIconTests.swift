//
//  OWIconTests.swift
//  
//
//  Created by Adil Erchouk on 11/5/22.
//

import XCTest
@testable import OpenWeather

final class OWIconTests: XCTestCase {

    #if canImport(UIKit)
    func testUIImage() throws {
        let icon = OWIcon.multiColorSystemSymbol("folder", accessibilityDescription: "Folder")!
        let expectedIcon = UIImage(systemName: "folder")!.applyingSymbolConfiguration(.preferringMulticolor())!
        
        XCTAssertEqual(icon, expectedIcon)
    }
    #elseif canImport(AppKit)
    func testNSImage() throws {
        let icon = OWIcon.multiColorSystemSymbol("folder", accessibilityDescription: "Folder")!

        XCTAssertEqual(icon.accessibilityDescription, "Folder")
        XCTAssertEqual(icon.symbolConfiguration, .preferringMulticolor())
    }
    #endif

}
