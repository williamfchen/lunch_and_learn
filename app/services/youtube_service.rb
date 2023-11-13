class YoutubeService
  def self.search(country)
    response = conn.get("/youtube/v3/search") do |req|
      req.params['q'] = country
      req.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      req.params['maxResults'] = 1
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:items].first
  end

  private

  def self.conn
    Faraday.new(url: 'https://www.googleapis.com/') do |f|
      f.params['key'] = Rails.application.credentials.youtube[:key]
      f.params['part'] = 'snippet'
    end
  end
end