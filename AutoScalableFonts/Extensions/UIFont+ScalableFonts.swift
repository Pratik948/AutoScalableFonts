//
//  UIFont+ScalableFonts.swift
//  AutoScalableFonts
//
//  Created by Pratik Jamariya on 16/10/20.
//

import UIKit

extension UIFont {
    func scaledFont(for size: ScalableFontReferenceScreenSize) -> UIFont {
        let multiplier = self.fontPointSizeMultiplier(referencedTo: size)
        var scaledFont = self
        if multiplier != 1 {
            scaledFont = self.withSize(self.pointSize * multiplier)
        }
        return scaledFont
    }
    
    func fontPointSizeMultiplier(referencedTo size: ScalableFontReferenceScreenSize) -> CGFloat {
        UIScreen.main.bounds.width/self.size(for: size)
    }
    
    private func size(for referenceSize: ScalableFontReferenceScreenSize) -> CGFloat {
        switch referenceSize {
        case .sizeCurrent:
            return UIScreen.main.bounds.width
        case .size320:
            return 320.0
        case .size375:
            return 375.0
        case .size414:
            return 414.0
        case .size768:
            return 768.0
        case .size810:
            return 810.0
        case .size834:
            return 834
        case .size1024:
            return 1024
        }
    }
}
