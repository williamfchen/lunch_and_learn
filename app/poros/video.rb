class Video
  attr_reader :title, :youtube_video_id

  def initialize(video_data, country)
    @title = video_data[:snippet][:title]
    @youtube_video_id = video_data[:id][:videoId]
    @country = country
  end
end