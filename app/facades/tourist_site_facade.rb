class TouristSiteFacade
  def self.search(country)
    capital = RestCountriesService.get_capital(country)
    locations = GeoapifyService.search(capital)
    locations.map do |location|
      TouristSite.new(location)
    end
  end
end