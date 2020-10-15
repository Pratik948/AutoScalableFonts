//
//  ScalableFonts.swift
//  AutoScalableFonts
//
//  Created by Pratik Jamariya on 15/10/20.
//

import CoreGraphics

let SFReferenceScreenSize: CGFloat = 375

public typealias FontUpdateHandler = (_ originalSize: CGFloat, _ preferredSize: CGFloat, _ multiplier: CGFloat) -> ()

public protocol ScalableFonts {
    static func enableFontAutoScale()
    static var autoScaleEnabled: Bool { get set }
    var autoScaleEnabled: Bool { get set }
    var originalFontPointSize: CGFloat { get set}
    var fontUpdateHandler:FontUpdateHandler? { get set }
}

struct AssociatedKeys {
    static var autoScaleEnabled = "autoScaleEnabled"
    static var originalFontPointSize = "originalFontPointSize"
    static var fontUpdateHandler = "fontUpdateHandler"
}
