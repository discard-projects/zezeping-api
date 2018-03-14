class Admin::CategoriesController < Admin::BaseController
  def index_roots
    categories = Category.roots.order(position: :asc)
    br_index categories
  end

  def increment_position
    br_show do |category|
      category.increment_position
    end
  end

  def decrement_position
    br_show do |category|
      category.decrement_position
    end
  end
end
