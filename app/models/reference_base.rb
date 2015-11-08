class ReferenceBase
	require 'pry'

	def initialize(sendMethod, unitObject, referenceObject)
		@unitObject = unitObject
		@sendMethod = sendMethod
		@referenceObject = referenceObject
	end	

	def updateData(cycleData)
			# check the parameters and determine whether the station is registered
			# if the station is registered, add another entry to the cycle table,
			# if not add a new cycle reference entry and add a new cycle table row
			insertData(cycleData)
		end

		def getDataByLocation

		end

		def getDataByTime

		end

		def getDataByInterval

		end

		def getDataByID(id)
			reference_parent = @referenceObject.where("number = ?", id.to_s ).first
			return reference_parent.send(@sendMethod)
		end


		private 

			def station_exists(cycle)
				station = @referenceObject.where("name = ? AND number = ?", cycle['name'], cycle['number'])
				if station.size > 0
					return station
				else
					return false
				end
			end

			def request_is_valid?(data)
			# check the valid request params are in the data structure
			# improve later
				return true

			end

			def insertData(data)
				station = station_exists(data)
				if request_is_valid?(data) && station != false
					# get the reference object and create a child thereof
					station.first.send(@sendMethod).create(selectCycleData(data))
				elsif request_is_valid?(data) && station == false
					parent = @referenceObject.create(selectReferenceData(data))
					parent.send(@sendMethod).create(selectCycleData(data))
				else
					puts "invalid request"
				end
			end

			def selectReferenceData(data)
				selected = data.select { |element| @referenceObject.columns.map {|column| column.name}.include? element}
				return selected
			end

			def selectCycleData(data)
				selected  = data.select { |element| @unitObject.columns.map {|column| column.name}.include? element}
				return selected
			end
end