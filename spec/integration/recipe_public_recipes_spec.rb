require 'rails_helper'

RSpec.describe 'Public recipes page', type: :feature do
  before do
    user = User.create(name: 'Tom')
    @recipe = Recipe.create(name: 'test_recipe', description: 'test description', cooking_time: '1 hour',
                            preparation_time: '1hour', public: true, user:)

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
