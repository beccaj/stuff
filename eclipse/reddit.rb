require 'httparty'
require 'json'
# url = "https://www.reddit.com//user/ensign_ro/saved.json"
# response = HTTParty.get(url) # gives me 403, guess they don't like bots
# File.write("reddit.json", response.body)



json = JSON.parse(File.read("reddit.json"))
data = json["data"]
children = data["children"]

filestring = children.map do |child|
  next unless child["data"]["body"]
  child["data"]["body"].strip
end.compact.join("\n------------------------------------------------\n")

File.write("reddit.txt", filestring)