//
//  AppDelegate.swift
//  AutoScalableFontsDemo
//
//  Created by Pratik Jamariya on 15/10/20.
//

import UIKit
import AutoScalableFonts

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // This makes whole app's label font to scale, including default control fonts like buttons, navigation item title, bar button item title
        UILabel.initiateScalableFonts(enabled: true)
        UITextView.initiateScalableFonts(enabled: true)
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        // this disbales auto scaling for this particular label, you can also disable auto scaling from interface builder
        // Keep in mind that if you set this property to true and add it to superview its font will be scallsced and cant be reverted.
        label.autoScaleEnabled = false
        return true
    }

}

