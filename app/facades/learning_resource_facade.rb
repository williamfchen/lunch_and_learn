class LearningResourceFacade
  def self.get_video(country)
    video_data = YoutubeService.search(country)
    return {} if video_data.nil? || video_data.empty?

    Video.new(video_data, country)
  end

  def self.get_images(country)
    images_data = UnsplashService.search(country)
    return [] if images_data.nil? || images_data.empty?

    images_data.map { |image_data| Image.new(image_data) }
  end
end
