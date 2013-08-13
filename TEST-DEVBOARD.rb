require 'curl'


key = '0fd862afb78af7d192ef49f26680809d08df724d737ec0f'

# Monitored application
app_number = 343931

account_id = 43367

response = Curl::Easy.perform("https://api.newrelic.com/api/v1/applications/#{app_number}/metrics.xml") do |curl| 
    curl.headers["x-api-key"] = "#{key}"
end
puts response.body_str