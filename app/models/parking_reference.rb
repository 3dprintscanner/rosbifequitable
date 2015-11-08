class ParkingReference < ActiveRecord::Base
	has_many :parkings
	@base = ReferenceBase.new('parkings',Parking, self)	

	def self.updateData(params)
		features = params['features']
		if features.is_a? Array 
			features.each  {|feature| @base.updateData(mapColumns(feature)) }
		elsif features.is_a? Hash
				@base.updateData(mapColumns(feature))
		else
		end
	end

	def self.getDataByObjectID(objectID)
		@base.getDataByID(objectID)
	end

	private 
	def self.mapColumns(params)
		#change nom to name and object_id to number
		params['name'] = params['attributes'].delete 'NOM'
		params['number'] = params['attributes'].delete 'ID'
		params['open'] = params['attributes'].delete 'FERME'
		params['capacity'] = params['attributes'].delete  'CAPACITE'
		params['automatique'] = params['attributes'].delete 'AUTOMATIQUE'
		params['lien'] = params['attributes'].delete 'LIEN'
		params['date_maj'] = params['attributes'].delete 'DATE_MAJ'
		params['taux_occup'] = params['attributes'].delete 'TAUX_OCCUP'
		params['taux_dispo'] = params['attributes'].delete 'TAUX_DISPO'
		params['latitude'] = params['geometry'].delete 'y'
		params['longitude'] = params['geometry'].delete 'x'
		params['latitude']  = params['latitude'].to_f
		params['longitude'] = params['longitude'].to_f
		params['date_maj'] = Date.parse(params['date_maj'])
		return params
	end
end
