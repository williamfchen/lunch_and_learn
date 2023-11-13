class EdamamService
  def self.search(country)
    response = conn.get("/api/recipes/v2") do |req|
      req.params['q'] = country
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:hits]
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.edamam.com') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['app_key'] = Rails.application.credentials.edamam[:key]
      f.params['app_id'] = Rails.application.credentials.edamam[:id]
      f.params['type'] = 'public'
    end
  end
end