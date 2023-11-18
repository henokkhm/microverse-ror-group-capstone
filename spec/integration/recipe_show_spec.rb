require 'rails_helper'

RSpec.describe 'Recipe details page', type: :feature do
  before do
    user = User.create(name: 'tom', email: 'name@gmail.com', password: '12345678')
    @recipe = Recipe.create(name: 'test_recipe', description: 'test description', cooking_time: '1 hour',
                            preparation_time: '1hour', public: true, user:)
    sign_in user
    visit recipe_path(@recipe)
  end

  it 'renders details of recipes' do
    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe.description)
    expect(page).to have_content(@recipe.cooking_time)
    expect(page).to have_content(@recipe.preparation_time)
    expect(page).to have_link('Generate shopping list')
  end

  it 'redirects to add food page on click' do
    click_link 'Add Ingredients'
    expect(page).to have_current_path(new_recipe_foods_recipe_path(@recipe))
  end

  it 'renders food table' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Value')
    expect(page).to have_content('Actions')
  end
end
