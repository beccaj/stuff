require 'rails'
def make_symbol(string)
  string.underscore.gsub(" ", "_").gsub("&#39;", "").gsub(/\W/, "").to_sym
end

hawaii1 = File.read("hawaii1.html")
hawaii2 = File.read("hawaii2.html")

heading_regex = /<strong>([^<]+)<\/strong>/
island_regex = /Big Island - \d{1,2} Kauai - \d{1,2} Lana&#39;i - \d{1,2} Maui - \d{1,2} Moloka&#39;i -\s?\d{1,2} Oahu - \d{1,2}/

headings = hawaii1.scan(heading_regex) + hawaii2.scan(heading_regex)
islands = hawaii1.scan(island_regex) + hawaii2.scan(island_regex)

scores = {}
headings.each_with_index do |heading, index|
  heading = make_symbol(heading.first)
  # activity = make_symbol(heading)
  island_string = islands[index]

  island_name_regex = /(Big Island|Kauai|Lana&#39;i|Maui|Moloka&#39;i|Oahu)/ # captures island name
  snippet_regex = /#{island_name_regex}\s?-\s?(\d{1,2})/
  snippets = island_string.scan(snippet_regex)

  island_hash = {}
  snippets.each do |snippet|
    island = make_symbol(snippet.first)
    value = snippet.last
    island_hash[island] = value.to_i
  end

  scores[heading] = island_hash
end

# puts scores.keys # to see available options
# world_class_resorts
# hotels
# vacation_condominiums
# money_is_no_object
# saving_some_money
# budget_travel
# enjoy_the_beach_and_the_sun
# deep_sea_fishing
# dining_out
# diverse_ecology
# fun_activities_for_the_kids
# golfing
# hikingkayaking
# historical_and_cultural_sites
# lush_tropical_vegetation
# national_and_state_parks
# nightlife
# privacy_and_seclusion
# romance
# shopping
# snorkelingscuba
# surfing__windsurfing
# whale_watching
my_weights = {
  world_class_resorts: 0,
  hotels: 0.5,
  vacation_condominiums: 0,
  money_is_no_object: 0,
  saving_some_money: 0.5,
  budget_travel: 0,
  enjoy_the_beach_and_the_sun: 1,
  deep_sea_fishing: 0,
  dining_out: 0.3,
  diverse_ecology: 0.5,
  fun_activities_for_the_kids: 0,
  golfing: 0,
  hikingkayaking: 1,
  historical_and_cultural_sites: 0.3,
  lush_tropical_vegetation: 0.7,
  national_and_state_parks: 1,
  nightlife: 0,
  privacy_and_seclusion: 0.5,
  romance: 0.7,
  shopping: 0,
  snorkelingscuba: 1,
  surfing__windsurfing: 0,
  whale_watching: 0
}

my_scores = {}
my_weights.each do |heading, weight|
  my_island_hash = {}
  scores[heading].each do |island, value|
    my_island_hash[island] = weight * value
  end
  my_scores[heading] = my_island_hash
end


final_scores = {big_island: 0, kauai: 0, lanai: 0, maui: 0,  molokai: 0, oahu: 0}

puts "My Scores:"
puts my_scores

# scores = {:hotel=>{:big=>4, :kauai=>8, :lanai=>0, :maui=>10, :molokai=>2, :oahu=>4}, :money=>{:big=>12, :kauai=>10, :lanai=>0, :maui=>12, :molokai=>6, :oahu=>16}, :beach=>{:big=>6, :kauai=>4, :lanai=>1, :maui=>0, :molokai=>1, :oahu=>8}, :diverse_ecology=>{:big=>10, :kauai=>6, :lanai=>1, :maui=>8, :molokai=>4, :oahu=>4}, :hiking=>{:big=>6, :kauai=>10, :lanai=>2, :maui=>8, :molokai=>2, :oahu=>4}, :vegetation=>{:big=>2, :kauai=>10, :lanai=>0, :maui=>6, :molokai=>4, :oahu=>2}, :national_parks=>{:big=>10, :kauai=>6, :lanai=>0, :maui=>8, :molokai=>0, :oahu=>4}, :privacy=>{:big=>6, :kauai=>10, :lanai=>0, :maui=>2, :molokai=>8, :oahu=>0}, :romance=>{:big=>8, :kauai=>10, :lanai=>2, :maui=>6, :molokai=>0, :oahu=>4}, :snorkeling=>{:big=>8, :kauai=>4, :lanai=>0, :maui=>10, :molokai=>0, :oahu=>6}}

my_scores.each {|name, hash| hash.each {|k, v| final_scores[k] += v}}

puts ""
puts "Final Scores:"
puts final_scores


