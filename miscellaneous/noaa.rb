require 'mechanize'

url = "http://forecast.weather.gov/product.php?site=EWX&issuedby=EWX&product=AFD&format=txt&version=12&glossary=0"
agent = Mechanize.new
page = agent.get(url)

body = page.body.downcase
start_string = "area forecast discussion"
end_string = "<!-- // content ends here -->"

start_index = body.index(start_string)
end_index = body.index(end_string)

body = body[start_index..end_index]

print body.gsub(/\.\s+\w/) {|x| x.upcase}