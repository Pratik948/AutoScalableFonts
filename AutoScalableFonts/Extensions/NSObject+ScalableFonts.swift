//
//  NSObject.swift
//  AutoScalableFonts
//
//  Created by Pratik Jamariya on 15/10/20.
//

import Foundation
import ObjectiveC.runtime


extension NSObject {
    class func swizzelInstance(selector: Selector, with new:Selector) {
        let cls: AnyClass = self
        if let originalMethod: Method = class_getInstanceMethod(self, selector),
           let overridenMethod: Method = class_getInstanceMethod(self, new) {
            let didAddMethod = class_addMethod(cls, selector, method_getImplementation(overridenMethod), method_getTypeEncoding(overridenMethod))
            if didAddMethod {
                class_replaceMethod(cls, new, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            }
            else {
                method_exchangeImplementations(originalMethod, overridenMethod)
            }
        }
    }
    class func swizzelClass(selector: Selector, with new:Selector) {
        if let originalMethod = class_getClassMethod(self, selector), let overridenMethod = class_getClassMethod(self, new) {
            method_exchangeImplementations(originalMethod, overridenMethod)
        }
    }
    func storeObject(_ object: Any?, for key: UnsafeRawPointer?) {
        if let key = key {
            objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    func getObject(for key: UnsafeRawPointer?) -> Any? {
        if let key = key {
            return objc_getAssociatedObject(self, key)
        }
        return nil
    }
}
