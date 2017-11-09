require 'watir'
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = '/home/chromedriver' 
browser = Watir::Browser.new :chrome

Before do
  @browser = browser
end

After do |scenario|
    if scenario.failed?
      Dir::mkdir('screenshots') if not File.directory?('screenshots')
      screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      # Saving Screenshot using Watir
      browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
end

at_exit do
  browser.close
end