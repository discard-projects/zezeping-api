module PostForm
  class Create < Reform::Form
    model :post

    property :title
    property :user_id
    property :content
    property :enabled, default: true
  end
end