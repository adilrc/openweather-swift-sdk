//
//  OWIconProvider.swift
//  
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation

public protocol OWIconProvider {
    /// Returns a `OWIcon` which is a typealias for either a `UIImage` is the device supports `UIKit` or `NSImage` if the device supports `AppKit`.
    var weatherIcon: OWIcon { get throws }
}
