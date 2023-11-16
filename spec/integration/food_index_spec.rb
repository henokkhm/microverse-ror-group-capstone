require 'rails_helper'

RSpec.describe 'Food Index Page', type: :feature do
  it 'displays placeholders' do
    visit foods_path

    expect(page).to have_content('Food list')
    expect(page).to have_link('Add New Food', href: new_food_path)

    expect(page).to have_content('Name')
    expect(page).to have_content('Measurement Unit')
    expect(page).to have_content('Unit Price')
    expect(page).to have_content('Actions')
  end

  it "redirects to add new food page on click" do
    visit foods_path
    click_link 'Add New Food'
    expect(page).to have_current_path(new_food_path)
  end
end