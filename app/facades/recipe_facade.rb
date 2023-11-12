class RecipeFacade
  def self.search(country)
    recipes = EdamamService.search(country)
    recipes.map do |recipe|
      Recipe.new(recipe, country)
    end
  end
end