//
//  ScalableFonts.swift
//  AutoScalableFonts
//
//  Created by Pratik Jamariya on 15/10/20.
//

import CoreGraphics

public enum ScalableFontReferenceScreenSize: Int {
    case sizeCurrent
    case size320//iPhone SE(1st Gen), iPhone 5S
    case size375//iPhone SE(2nd Gen), iPhone 8/7/6/X etc
    case size414//iPhone 12/11/Xr/8p/7p/6p
    case size768//iPad Mini/Air
    case size834//iPad Pro 10.5/11 Inch
    case size810//iPad Pro 10.2 Inch
    case size1024//iPad Pro 12.9 Inch
}

public typealias FontUpdateHandler = (_ originalSize: CGFloat, _ preferredSize: CGFloat, _ multiplier: CGFloat) -> ()

public protocol ScalableFonts {
    static func enableFontAutoScale()
    static var autoScaleEnabled: Bool { get set }
    static var referenceSize: ScalableFontReferenceScreenSize { get set }
    
    var autoScaleEnabled: Bool { get set }
    var originalFontPointSize: CGFloat { get set}
    var fontUpdateHandler:FontUpdateHandler? { get set }
    var referenceSize: ScalableFontReferenceScreenSize { get set }
}

struct AssociatedKeys {
    static var autoScaleEnabled = "autoScaleEnabled"
    static var originalFontPointSize = "originalFontPointSize"
    static var fontUpdateHandler = "fontUpdateHandler"
    static var referenceSize = "referenceSize"
}
