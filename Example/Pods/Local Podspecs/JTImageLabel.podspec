Pod::Spec.new do |s|
  s.name         = "JTImageLabel"
  s.version      = "1.0.0"
  s.summary      = ""
  s.homepage     = "https://github.com/jonathantribouharet/JTImageLabel"
  s.license      = { :type => 'MIT' }
  s.author       = { "Jonathan Tribouharet" => "jonathan.tribouharet@gmail.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/jonathantribouharet/JTImageLabel.git", :tag => s.version.to_s }
  s.source_files  = 'JTImageLabel/*'
  s.requires_arc = true
end
