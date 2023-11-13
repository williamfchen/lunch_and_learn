require 'rails_helper'

RSpec.describe Recipe do
  let(:recipe_data) do
    {
      recipe: {
        label: 'Test Recipe',
        url: 'https://example.com/recipe',
        image: 'https://example.com/recipe.jpg'
      }
    }
  end

  subject(:recipe) { described_class.new(recipe_data, "france") }

  describe '#type' do
    it 'returns "recipe"' do
      expect(recipe.type).to eq('recipe')
    end
  end

  describe '#title' do
    it 'returns the recipe title' do
      expect(recipe.title).to eq('Test Recipe')
    end
  end

  describe '#url' do
    it 'returns the recipe URL' do
      expect(recipe.url).to eq('https://example.com/recipe')
    end
  end

  describe '#country' do
    it 'returns the recipe country' do
      expect(recipe.country).to eq("france")
    end
  end

  describe '#image' do
    it 'returns the recipe image URL' do
      expect(recipe.image).to eq('https://example.com/recipe.jpg')
    end
  end
end
