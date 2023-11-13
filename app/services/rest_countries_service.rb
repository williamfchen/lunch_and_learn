class RestCountriesService
  def self.random_country
    response = conn.get("/v3.1/all")
    json = JSON.parse(response.body, symbolize_names: true)
    json.sample[:name][:common]
  end

  private

  def self.conn
    Faraday.new(url: "https://restcountries.com")
  end

end