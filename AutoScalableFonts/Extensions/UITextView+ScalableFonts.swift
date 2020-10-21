//
//  UITextView+ScalableFonts.swift
//  AutoScalableFonts
//
//  Created by Pratik Jamariya on 16/10/20.
//

import UIKit

var isTextViewGlobalAutoScaleEnabled: Bool = false
var textViewGlobalReferenceSize: ScalableFontReferenceScreenSize = .sizeCurrent

extension UITextView: ScalableFonts {

    public static func initiateScalableFonts(enabled: Bool, referenceSize: ScalableFontReferenceScreenSize) {
        self.autoScaleEnabled = enabled
        self.referenceSize = referenceSize
        swizzelInstance(selector: #selector(willMove(toWindow:)), with: #selector(swizzle_willMove(to:)))
    }
    
    public static func enableFontAutoScale() {
        self.autoScaleEnabled = true
    }
    
    public static var autoScaleEnabled: Bool {
        get {
            isTextViewGlobalAutoScaleEnabled
        }
        set {
            isTextViewGlobalAutoScaleEnabled = newValue
        }
    }
    
    public static var referenceSize: ScalableFontReferenceScreenSize {
        get {
            textViewGlobalReferenceSize
        }
        set {
            textViewGlobalReferenceSize = newValue
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
            return size as? CGFloat ?? self.font!.pointSize
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
    public var referenceSize: ScalableFontReferenceScreenSize {
        get {
            guard let size = getObject(for: &AssociatedKeys.referenceSize) as? Int else {
                return .sizeCurrent
            }
            return ScalableFontReferenceScreenSize.init(rawValue: size) ?? .sizeCurrent
        }
        set {
            storeObject(newValue, for: &AssociatedKeys.referenceSize)
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
    
    private var wasInstanceAutoScaleRefereceDefined: Bool {
        getObject(for: &AssociatedKeys.referenceSize) != nil
    }
    
    @objc
    public func swizzle_willMove(to newWindow: UIWindow?) {
        let scalingIsNeeded = round(originalFontPointSize) == round(font!.pointSize)

        if newWindow != nil && scalingIsNeeded {
            var referenceSize: ScalableFontReferenceScreenSize = .sizeCurrent
            if self.autoScaleEnabled {
                referenceSize = wasInstanceAutoScaleRefereceDefined ? self.referenceSize : type(of: self).referenceSize
            }
            else if type(of: self).autoScaleEnabled && !wasAutoScaleExplicitlyDisabled {
                referenceSize = type(of: self).referenceSize
            }
            if referenceSize != ScalableFontReferenceScreenSize.sizeCurrent {
                originalFontPointSize = font!.pointSize
                font = font!.scaledFont(for: self.referenceSize)
                // Call update handler if set
                fontUpdateHandler?(originalFontPointSize, font!.pointSize, font!.fontPointSizeMultiplier(referencedTo: self.referenceSize))
            }
        }
        return self.swizzle_willMove(to: newWindow)
    }
    
}

