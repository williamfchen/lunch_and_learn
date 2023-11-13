class TouristSite
  attr_reader :name, :address, :place_id, :id

  def initialize(location_data)
    @id = nil
    @name = location_data[:properties][:name]
    @address = location_data[:properties][:formatted]
    @place_id = location_data[:properties][:place_id]
  end
end 