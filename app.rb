# app.rb
require "uri"

# Simple, non-exploit use of URI so the gem is definitely loaded
def parse_url(url)
  uri = URI.parse(url)
  {
    scheme: uri.scheme,
    host:   uri.host,
    path:   uri.path,
  }
end

if __FILE__ == $0
  url = "https://user:password@example.com/path?query=1"
  result = parse_url(url)
  puts "Scheme: #{result[:scheme]}"
  puts "Host:   #{result[:host]}"
  puts "Path:   #{result[:path]}"
end
