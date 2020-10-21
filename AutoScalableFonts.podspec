Pod::Spec.new do |spec|
  spec.name         = "AutoScalableFonts"
  spec.version      = "1.0.0"
  spec.summary      = "Scale the font for UILabel and UITextView proportionally across all the screen sizes."
  spec.description  = <<-DESC
			Scale the font for UILabel and UITextView proportionally across all the screen sizes. Just define the screen size to be used as reference for scaling and the library will update all the instances of the UILabel and UITextView automatically.
                   DESC

  spec.homepage     = "https://github.com/Pratik948/AutoScalableFonts"
  spec.license      = "MIT"
  spec.author             = { "Pratik948" => "jamariyapratik@gmail.com" }
  spec.social_media_url   = "https://twitter.com/pratikjamariya"

  spec.swift_versions = ['5.2']
  spec.platform       = :ios
  spec.platform       = :ios, "11.0"

  spec.source       = { :git => "https://github.com/Pratik948/AutoScalableFonts.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "AutoScalableFonts/**/*.{h,m,swift}"

end
