require 'date'
# require 'prawn'

date = DateTime.new(2014,6,9)
end_date = DateTime.new(2014,6,15)
month = date.month
year = date.year
week = date.cweek
filestring = ""
# @bullet = "\u25FB" # smallest 
# @bullet = "\u2B1C" # shaded 
# @bullet = "\u25A2" # small and rounded
# @bullet = "\u20DE" # big
# @bullet = "__"
@bullet = "-"

continue = true

def add_bullets(filestring, date)
	filestring << "#{date.strftime("%A, %-m/%-d/%Y")} \n"
	filestring << "    #{@bullet} No Dessert before 2pm and vegetable first\n"	
	filestring << "    #{@bullet} No Dessert at Work\n" unless date.saturday? || date.sunday?
	filestring << "    #{@bullet} Left 500 (600 better) calories for dinner\n"	unless date.saturday? || date.sunday?
	filestring << "    #{@bullet} Ate Vegetable \n"
	filestring << "    #{@bullet} Met protein goal (80g)\n"		
	filestring << "    #{@bullet} Recorded \n"							
	filestring << "    #{@bullet} Under Calorie Goal\n"
	filestring << "    #{@bullet} \n"

	filestring << "\n"
	unless date.saturday? || date.sunday?
		filestring << "    positive:                    __________\n"
		filestring << "    __________ calories over = - __________ (divide by 100 round down) \n" 
	end
	filestring << "    total:                       __________\n\n"
end

while date <= end_date && continue 
	while date.year == year && continue #&& date.year <= end_date.year
		filestring << "#{date.strftime("%B %Y")}\n"	
		while date.month == month && continue  #&& date.month <= end_date.month
			while date.cweek == week && continue  #&& date.cweek <= end_date.cweek
				filestring = add_bullets(filestring, date)

				date = date.next_day			
				continue = false unless date <= end_date				
			end
			week = (week % 53) + 1
			filestring << "  #{@bullet} Recorded at least 5 days this week \n\n"
			filestring << "  total for week:            __________\n\n"
		end
		# filestring << "Total for month: __________ * .25 = $ __________\n\n"
		month = (month % 12) + 1
	end
	year = year + 1
end


File.write("../Dropbox/calendar.txt", filestring)
# Prawn::Document.generate("../Dropbox/calendar.pdf") do # doesn't print the pretty bullets :(
#   text filestring
# end