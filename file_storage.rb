
class Cars
	#methods that read the files
	def self.read_car_makes
		return File.readlines("car-makes.txt")
	end

	def self.read_car_models
		return File.readlines("car-models.txt")
	end

	def self.generate_car_hash
		car_hash = Hash.new
		
		makes_arr = self.read_car_makes
		models_arr = self.read_car_models

		makes_arr.each do |make|
			make = make.gsub("\n", "")
			car_hash[make] = []
			models_arr.each do |model|
				model = model.gsub("\n", "")
				if make[0] == model[0]
					model[0..1] = ""
					car_hash[make].push(model)
				end
			end
		end
		puts car_hash
	end
	self.generate_car_hash
end