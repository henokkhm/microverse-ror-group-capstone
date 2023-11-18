require 'rails_helper'

RSpec.describe 'Recipe details page', type: :feature do
  before do
    user = User.create(name: 'Tom')
    @recipe = Recipe.create(name: 'test_recipe', description: 'test description', cooking_time: '1 hour',
                            preparation_time: '1hour', public: true, user:)

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
    click_link 'Add food'
    expect(page).to have_current_path(new_food_path)
  end

  it 'renders food table' do
    expect(page).to have_content('Name')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Unit Price')
    expect(page).to have_content('Actions')
  end
end
