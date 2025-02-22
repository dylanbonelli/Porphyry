require 'capybara/cucumber'
require 'capybara/cuprite'

Before do
  Capybara.current_session.driver.add_headers("Accept-Language" => "fr")
end
Capybara.run_server = false
Capybara.default_driver = :cuprite
Capybara.javascript_driver = :cuprite
Capybara.app_host = ENV["APP_HOST"] || "http://localhost:3000"
Capybara.default_max_wait_time = 10
Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(app,
    browser_options: { 'no-sandbox': nil },
    timeout: 30
  )
end

def getURI(name)
  uri = nil
  case name
    when "SNZ 006"
      uri = "/item/Vitraux%20-%20Bénel/8a1750b17b11944108efaac593f4448e4e9f966b"
    when "AXN 009"
      uri = "/item/Vitraux%20-%20Bénel/dff21da25a2bebd654e81536fc5aaa8a63ab6e4f"
    when "SR 005"
      uri = "/item/Vitraux%20-%20Bénel/493f2a3702be0e9a67a6fd29700fd4dff8f6986a"
    when "SJ 001"
      uri = "/item/Vitraux%20-%20Bénel/8d27115e20f9439b627ac511ade9a05bbe509130"
    when "SJ 000"
      uri = "/item/Vitraux%20-%20Bénel/358d1c9f168311a9fe7bd7e2737c181514652e9d"
    when "AXN 009 B&W"
      uri = "/item/Vitraux - Recensement/d4dd4b9af975a07ecd0331307db8ca24daad7535"
  end
  return uri
end

def getUUID(name)
  case name
    when "Abram/Abraham"
      uuid = "f1520229979b11428f94a004f880c022"
    when "XIXe s."
      uuid = "addd464d06159c4eb0b9666cffb2042c"
    when "1518"
      uuid = "fed64e22e60941409ad45c167fc396b8"
    when "vers 1520"
      uuid = "e01a7cb572461a43a22aa8f771235cb6"
    else
      range = [*'0'..'9',*'A'..'F']
      uuid = Array.new(36){ range.sample }.join
  end
  return uuid
end

