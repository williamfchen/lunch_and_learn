class UnsplashService
  def self.search(country)
    response = conn.get("/search/photos") do |req|
      req.params['query'] = country
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results]
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com/') do |f|
      f.params['client_id'] = Rails.application.credentials.unsplash[:client_id]
    end
  end
end