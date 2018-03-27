class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def updated_time
    updated_at.to_s
  end

  def created_time
    created_at.to_s
  end
end
