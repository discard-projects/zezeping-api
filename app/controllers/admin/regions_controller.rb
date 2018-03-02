class Admin::RegionsController < ApplicationController
  def index
    regions = Region.roots
    super regions
  end
end
