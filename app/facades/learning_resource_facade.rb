class LearningResourceFacade
  def self.get_video(country)
    video = YoutubeService.search(country)
    Video.new(video, country)
  end

  def self.get_images(country)
    images = UnsplashService.search(country)
    images.map do |image|
      Image.new(image)
    end
  end
end