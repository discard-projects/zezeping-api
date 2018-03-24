class Admin::ProductCategoriesController < Admin::BaseController
  def index
    @product_categories = Store.find(params['store_id']).product_categories
  end
end
