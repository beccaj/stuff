remotes = ["Alan Lai","Allison Smith", "Amy Loria", "Brian Shipbaugh", "Chris Catatao", "Chris Rack", "Craig Hess", "Dayna Shaw", "Doug Detlefsen", "Jason Bagby", 
"Joseph Zara", "Kent Wu", "Nick  Roberts", "Sarah Maxfield", "Shanda Livingston", "Stephanie Gutierrez", "Trevor Williams" ];

remotes.each do |name|
	person = Salesperson.find_by_name name
	if person
		person.update_attributes :region => "US - Remote"
		# person.update_attributes :enabled => false
	end
	puts "Disabled #{name}"
end