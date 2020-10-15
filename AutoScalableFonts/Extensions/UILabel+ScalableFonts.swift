//
//  UILabel+ScalableFonts.swift
//  AutoScalableFonts
//
//  Created by Pratik Jamariya on 15/10/20.
//

import UIKit

var isLabelGlobalAutoScaleEnabled: Bool = false

extension UILabel: ScalableFonts {

    public static func initiateScalableFonts(enabled: Bool) {
        self.autoScaleEnabled = enabled
        swizzelInstance(selector: #selector(willMove(toWindow:)), with: #selector(swizzle_willMove(to:)))
    }
    
    public static func enableFontAutoScale() {
        self.autoScaleEnabled = true
    }
    
    public static var autoScaleEnabled: Bool {
        get {
            isLabelGlobalAutoScaleEnabled
        }
        set {
            isLabelGlobalAutoScaleEnabled = newValue
        }
    }
    
    public var autoScaleEnabled: Bool {
        get {
            getObject(for: &AssociatedKeys.autoScaleEnabled) as? Bool ?? false
        }
        set {
            storeObject(newValue, for: &AssociatedKeys.autoScaleEnabled)
        }
    }
    public var originalFontPointSize: CGFloat {
        get {
            let size = getObject(for: &AssociatedKeys.originalFontPointSize)
            return size as? CGFloat ?? self.font.pointSize
        }
        set {
            storeObject(newValue, for: &AssociatedKeys.originalFontPointSize)
        }
    }
    public var fontUpdateHandler: FontUpdateHandler? {
        get {
            (getObject(for: &AssociatedKeys.fontUpdateHandler) as? FontUpdateBlockWrapper)?.fontUpdateHandler
        }
        set {
            let wrapper = FontUpdateBlockWrapper(handler: newValue)
            storeObject(wrapper, for: &AssociatedKeys.originalFontPointSize)
        }
    }
    
    @IBInspectable
    public var autoScale: Bool {
        get {
            self.autoScaleEnabled
        }
        set {
            self.autoScaleEnabled = newValue
        }
    }
    
    private var wasAutoScaleExplicitlyDisabled: Bool {
        getObject(for: &AssociatedKeys.autoScaleEnabled) != nil && !self.autoScaleEnabled
    }
    
    @objc
    public func swizzle_willMove(to newWindow: UIWindow?) {
        let scalingIsNeeded = round(originalFontPointSize) == round(font.pointSize)

        if newWindow != nil && scalingIsNeeded {
            if (self.autoScaleEnabled || type(of: self).autoScaleEnabled) && !wasAutoScaleExplicitlyDisabled {
                originalFontPointSize = font.pointSize
                font = font.scaledFont
                // Call update handler if set
                fontUpdateHandler?(originalFontPointSize, font.pointSize, font.fontPointSizeMultiplier)
            }
        }
        return self.swizzle_willMove(to: newWindow)
    }
    
}
