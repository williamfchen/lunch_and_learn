class LocationFacade
  def self.search(category)
    locations = GeoapifyService.search(category)
    locations.map do |location|
      Location.new(location)
    end
  end
end