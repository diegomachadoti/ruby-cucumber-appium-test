require "appium_lib"
require "eventmachine"
require "pry"
def caps
  { caps: {
    deviceName: "Anyname",
    platformName: "Android",
    app: (File.join(File.dirname(__FILE__), "PreciseUnitConversion.apk")),
    appPackage: "com.ba.universalconverter",
    appActivity: "MainConverterActivity",
    newCommandTimeout: "3600"
  } }
end

=begin
def caps
  { caps: {
    deviceName: "iPhone 8 Plus",
    platformName: "iOS",
    platformVersion: "12.1",
    app: (File.join(File.dirname(__FILE__), "AppiOS.app")),
    bundleId: "iOS.BonusApp",
    newCommandTimeout: "3600"
  }}
end
=end

Appium::Driver.new(caps,true)
Appium.promote_appium_methods Object

