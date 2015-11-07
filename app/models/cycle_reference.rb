class CycleReference < ActiveRecord::Base
	has_many :cycles
	validates :name , presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	require 'pry'

	attr_accessor


	def self.updateData(cycleData)
		# check the parameters and determine whether the station is registered
		# if the station is registered, add another entry to the cycle table,
		# if not add a new cycle reference entry and add a new cycle table row
		
		@cycleData = cycleData

		if @cycleData.is_a? Array 
			@cycleData.each do |cycle|
				insertData(cycle)
			end
		elsif @cycleData.is_a? Hash
			insertData(@cycleData)
		else

		end
	end


	private 

		def self.station_exists?(cycle)
			if CycleReference.where("name = ? AND number = ?", cycle['name'], cycle['number']).size > 0
				return true
			else
				return false
			end
		end

		def self.request_is_valid?(data)
		# check the valid request params are in the data structure
		# improve later
			return true

		end

		def self.insertData(data)
			if request_is_valid?(data) && station_exists?(data)
				Cycle.create(data)
			elsif request_is_valid?(data) && !station_exists?(data)
				CycleReference.create(selectReferenceData(data))
				Cycle.create(selectCycleData(data))
			else
				puts "invalid request"
			end
		end

		def self.selectReferenceData(data)
			selected = data.select { |element| CycleReference.columns.map {|column| column.name}.include? element}
			# binding.pry
			return selected
		end

		def self.selectCycleData(data)
			selected  = data.select { |element| Cycle.columns.map {|column| column.name}.include? element}
			# binding.pry
			return selected
		end
	
end
