class GeoapifyService
  def self.search(capital)
    response = conn.get("/v2/places") do |req|
      req.params['categories'] = 'tourism.sights'
      req.params['filter'] = "circle:#{capital.last},#{capital.first},1000"
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:features]
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.geoapify.com') do |f|
      f.params['apiKey'] = Rails.application.credentials.geoapify[:key]
    end
  end
end
