class Admin::CategoriesController < Admin::BaseController
  def index_roots
    categories = Category.roots
    br_index categories
  end
end
