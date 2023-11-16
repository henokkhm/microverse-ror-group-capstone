class PagesController < ApplicationController
  def publicRecipes
    @recipes = Recipe.where(public: true)
  end
end
