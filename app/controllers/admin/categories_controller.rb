class Admin::CategoriesController < ApplicationController
  def index_roots
    categories = Category.roots
    br_index categories
  end
end
