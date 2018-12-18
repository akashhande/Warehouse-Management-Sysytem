class DropdownSelection
    
    def self.getDropdownValues(city)
        puts "product_city:"+city.to_s
        dublinZip = ["Dublin 1", "Dublin 2", "Dublin 3", "Dublin 4", "Dublin 5"]
        corkZip = ["Cork 1", "Cork 2", "Cork 3", "Cork 4", "Cork 5"]
        galwayZip = ["Galway 1", "Galway 2", "Galway 3", "Galway 4", "Galway 5"]
        limricZip = ["Limric 1", "Limric 2", "Limric 3", "Limric 4", "Limric 5"]
        if city == "Dublin"
               return dublinZip
            elsif city == "Cork"
                return corkZip
            elsif city == "Galway"
               return galwayZip
            elsif city == "Limric"
                return limricZip
            else
               puts "Wrong choice"
            end
    end
end