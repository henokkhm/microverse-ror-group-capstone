class PagesController < ApplicationController
  def public_recipes
    @recipes = Recipe.where(public: true)
  end
end
