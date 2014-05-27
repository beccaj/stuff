require 'date'

date = DateTime.now #DateTime.new(2014,5,1)
end_date = DateTime.new(2014,6,30)
month = date.month
year = date.year
week = date.cweek
filestring = ""
# bullet = "\u25FB"
@bullet = "\u2B1C"
continue = true

def add_bullets(filestring, date)
	filestring << "#{date.strftime("%A, %-m/%-d/%Y")} \n"
	filestring << "    #{@bullet} No Dessert at Work\n"
	filestring << "    #{@bullet} Ate Vegetable \n"
	filestring << "    #{@bullet} Met protein goal (80g)\n"		
	filestring << "    #{@bullet} Recorded \n"							
	filestring << "    #{@bullet} Under Calorie Goal\n"
	filestring << "    #{@bullet} \n"

	filestring
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
		end
		filestring << "Total for #{(date-30).strftime("%B")}: __________ * .25 = $ __________\n\n"
		month = (month % 12) + 1
	end
	year = year + 1
end


File.write("../Dropbox/calendar.txt", filestring)