class Attachment < ApplicationRecord
  enum kind: { kind_image: 0, kind_video: 1 }
  ransacker :kind, formatter: proc { |v| kinds[v] }
end
