class Recipe
  attr_reader :id, :type, :title, :url, :country, :image

  def initialize(recipe_data, country)
    @id = nil
    @type = "recipe"
    @title = recipe_data[:recipe][:label]
    @url = recipe_data[:recipe][:url]
    @country = country
    @image = recipe_data[:recipe][:image]
  end
end