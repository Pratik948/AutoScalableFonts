//
//  UIFont+ScalableFonts.swift
//  AutoScalableFonts
//
//  Created by Pratik Jamariya on 16/10/20.
//

import UIKit

extension UIFont {
    var scaledFont: UIFont {
        get {
            let multiplier = self.fontPointSizeMultiplier
            var scaledFont = self
            if multiplier != 1 {
                scaledFont = self.withSize(self.pointSize * multiplier)
            }
            return scaledFont
        }
    }
    var fontPointSizeMultiplier: CGFloat {
        get {
            UIScreen.main.bounds.width/SFReferenceScreenSize
        }
    }
}
