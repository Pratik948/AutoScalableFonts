# AutoScalableFonts

[![Twitter URL](https://img.shields.io/twitter/url?label=Pratik%20Jamariya&style=social&url=https%3A%2F%2Ftwitter.com%2Fpratikjamariya)](https://twitter.com/pratikjamariya)

This library is written in swift and takes reference from [AMXFontAutoScale](https://github.com/alexmx/AMXFontAutoScale)

Scale the font for **`UILabel`** and **`UITextView`** proportionally across all the screen sizes. Just define the screen size to be used as reference for scaling and the library will update all the instances of the **`UILabel`** and **`UITextView`** automatically.

## Usage

1) Set the **`UILabel`** or **`UITextView`** font using `Interface Builder` or the `font` property directly.
2) Define for which **labels** and **text views** the font should be auto scaled. Check the examples below for more details.
3) Define the reference screen size to be used for scaling. Your original font size will match exactly the chosen reference screen size and will be scaled up or down for other screen sizes.
3) Enjoy the magic!

iPhone SE 1st Gen | iPhone SE 2nd Gen | iPhone 11 Pro Max
------------ | ------------- | -------------
![iPhone SE 1st Gen](/Screenshots/iPhone-SE-1st-Gen.png) | ![iPhone SE 2nd Gen](/Screenshots/iPhone-SE-2nd-Gen.png) | ![iPhone 11 Pro Max](/Screenshots/iPhone-11-Pro-Max.png)


#### Define auto scaling for one instance

Define the reference screen size for a specific label. Different instances can have different reference screen sizes defined:

```swift
import AutoScalableFonts

class SomeViewController: UIViewController {
    
    @IBOutlet var someLabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someLabel.autoScaleEnabled = false
        someLabel.referenceSize = .size320
    }
}
```

Or using the Interface Builder:

![Interface Builder](/Screenshots/Interface-Builder.png)


#### :earth_asia: Define global auto scaling

⚠️ - Be careful when using this one as it literally scales all the instances of **`UILabel`** and **`UITextView`** from your app, even the unobvious labels or text views in the system controls and components.

```swift
import AutoScalableFonts

class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Scale all the label fonts using the 4 inch screen size as a reference
        UILabel.initiateScalableFonts(enabled: true, referenceSize: .size375)
        
        return true
  }
}
```
Note: The instance scaling overrides the global one if set.

## Installation

#### CocoaPods

If you are using **CocoaPods**, you can as well use it to integrate the library by adding the following lines to your `Podfile`.

```
use_frameworks!

target 'YourAppTarget' do
    pod "AutoScalableFonts"
end

```

## License
This project is licensed under the terms of the MIT license. See the LICENSE file.
