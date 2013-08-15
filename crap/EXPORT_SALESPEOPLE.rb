list = []; Salesperson.all.map{|p| hash = {}; p.attributes.keys.map{|a| hash[a] = p.attributes[a] unless ["id", "created_at", "updated_at"].include? a }; list << hash}
puts list

