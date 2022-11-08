//
//  OWIconProvider.swift
//
//
//  Created by Adil Erchouk on 11/4/22.
//

import Foundation

public protocol OWIconProvider {
  /// Returns the system item of the weather icon to be used with `SFSymbol`
  var weatherIconSystemName: String { get }
    
    /// Returns the weather icon accessibility description
    var weatherIconAccessibilityDescription: String? { get }
}
