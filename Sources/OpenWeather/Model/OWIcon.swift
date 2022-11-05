//
//  OWIcon.swift
//  
//
//  Created by Adil Erchouk on 11/3/22.
//

import Foundation

#if canImport(UIKit)
import UIKit

public typealias OWIcon = UIImage

extension OWIcon {
    /// Convenience method that can be called in both UIKit and AppKit returning the system symbol with multicolor symbol configuration
    /// - Parameters:
    ///   - name: System symbol name
    ///   - accessibilityDescription: Accessibility description (only applicable to MacOS)
    /// - Returns: `OWIcon` which is a wrapper around `NSImage` for `AppKit` capable devices and `UIImage` for `UIKit` capable devices
    static func multiColorSystemSymbol(_ name: String, accessibilityDescription: String? = nil) -> OWIcon? {
        return OWIcon(systemName: name)?.applyingSymbolConfiguration(.preferringMulticolor())
    }
}
#elseif canImport(AppKit)
import AppKit

public typealias OWIcon = NSImage

extension OWIcon {
    /// Convenience method that can be called in both UIKit and AppKit returning the system symbol with multicolor symbol configuration
    /// - Parameters:
    ///   - name: System symbol name
    ///   - accessibilityDescription: Accessibility description (only applicable to MacOS)
    /// - Returns: `OWIcon` which is a wrapper around `NSImage` for `AppKit` capable devices and `UIImage` for `UIKit` capable devices
    static func multiColorSystemSymbol(_ name: String, accessibilityDescription: String? = nil) -> OWIcon? {
        return OWIcon(systemSymbolName: name, accessibilityDescription: accessibilityDescription)?.withSymbolConfiguration(.preferringMulticolor())
    }
}
#endif
