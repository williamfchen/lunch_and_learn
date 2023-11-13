class RestCountriesService
  def self.random_country
    response = conn.get("/v3.1/all")
    json = JSON.parse(response.body, symbolize_names: true)
    json.sample[:name][:common]
  end

  def self.get_capital(country)
    response = conn.get("/v3.1/name/#{country}")
    json = JSON.parse(response.body, symbolize_names: true)
    json.first[:capitalInfo][:latlng]
  end

  private

  def self.conn
    Faraday.new(url: "https://restcountries.com")
  end

end