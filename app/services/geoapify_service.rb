class GeoapifyService
  def self.search(category)
    response = conn.get("/v2/places") do |req|
      req.params['categories'] = category
      req.params['filter'] = 'rect:11.573106549898483,48.13898913611139,11.57704581350751,48.13666585409989'
      req.params['limit'] = 20
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