class Location
  attr_reader :name, :country, :postcode, :id

  def initialize(location_data)
    @id = nil
    @name = location_data[:properties][:name]
    @country = location_data[:properties][:country]
    @postcode = location_data[:properties][:postcode]
  end
end