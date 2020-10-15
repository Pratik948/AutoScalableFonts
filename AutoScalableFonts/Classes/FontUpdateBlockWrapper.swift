//
//  FontUpdateBlockWrapper.swift
//  AutoScalableFonts
//
//  Created by Pratik Jamariya on 16/10/20.
//

import UIKit

class FontUpdateBlockWrapper: NSObject {
    var fontUpdateHandler: FontUpdateHandler?
    convenience init(handler: FontUpdateHandler?) {
        self.init()
        self.fontUpdateHandler = handler
    }
}
