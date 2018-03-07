class Admin::RegionsController < Admin::BaseController
  def index_roots
    regions = Region.roots
    br_index regions
  end
end
