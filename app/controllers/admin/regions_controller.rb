class Admin::RegionsController < ApplicationController
  def index_roots
    regions = Region.roots
    br_index regions
  end
end
