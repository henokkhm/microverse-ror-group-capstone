require 'rails_helper'

RSpec.describe 'Recipe Index Page', type: :feature do
  before do
    user = User.create(name: 'tom', email: 'name@gmail.com', password: '12345678')
    @recipe = Recipe.create(name: 'test_recipe', description: 'test description', cooking_time: '1 hour',
                            preparation_time: '1hour', public: true, user:)

    sign_in user

    visit recipes_path
  end
  describe 'recipe list page' do
    it 'renders lists of recipes' do
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content(@recipe.description)
      expect(page).to have_button('Remove')
    end

    it 'redirects to recipe details page on click' do
      click_link @recipe.name
      expect(page).to have_current_path(recipe_path(@recipe))
    end

    it 'deletes recipe on click' do
      click_button 'Remove'
      expect(page).to have_content('Recipe deleted successfully!')
      expect(page).not_to have_content(@recipe.name)
    end
  end
  describe 'public recipe page' do
    before do
      visit public_recipes_path
    end

    it 'displays placeholders' do
      expect(page).to have_content('Public Recipes')
    end

    it 'redirects to recipe details page on click' do
      click_link @recipe.name
      expect(page).to have_current_path(recipe_path(@recipe))
    end

    it 'renders lists of recipes' do
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content(@recipe.user.name)
    end
  end
end
