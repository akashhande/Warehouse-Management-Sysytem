class ProductPrediction
    
    def self.getPrediction(product)
        puts "product_city:"+product.to_s
        city = getTopSellingCity(product)
        zipCount = getTopSellingZip(product, city)
        getTopPredictions(city, zipCount)
    end
    
    def self.getTopSellingCity(product)
        counter = Hash.new
        counter["Dublin"]= 0
        counter["Cork"]= 0
        counter["Galway"]= 0
        counter["Limric"]= 0
        product.each do |city|
            city.each_with_index do |item, index|
                if index ==0 && item == "Dublin"
                   counter["Dublin"] += 1
                elsif index ==0 && item == "Cork"
                    counter["Cork"] += 1
                elsif index ==0 && item == "Galway"
                   counter["Galway"] += 1
                elsif index ==0 && item == "Limric"
                   counter["Limric"] += 1
                end
            end
        end 
        city = counter.max_by{|k,v| v}[0]
        return city
    end
    
    def self.getTopSellingZip(product, test1)
        counterFinal = Hash.new
        counterFinal["1"]= 0
        counterFinal["2"]= 0
        counterFinal["3"]= 0
        counterFinal["4"]= 0
        counterFinal["5"]= 0
        product.each_with_index do |city, city_index|
            if city[0] == test1 && city[1] == "1"
                counterFinal["1"] += 1
            elsif city[0] == test1 && city[1] == "2"
                counterFinal["2"] += 1
            elsif city[0] == test1 && city[1] == "3"
                counterFinal["3"] += 1
            elsif city[0] == test1 && city[1] == "4"
                counterFinal["4"] += 1
            elsif city[0] == test1 && city[1] == "5"
                counterFinal["5"] += 1
            end 
        end
        return counterFinal
    end
    
    def self.getTopPredictions(city, zipCounter)
        output = []
        output.push(city, zipCounter.sort_by { |k, v| v }.reverse[0..2])
        return output
    end
end