json.partial! 'partial/paginate_meta', object: @subjects
json.items @subjects do |subject|
  json.(subject, :id, :content, :enabled, :discussions_count, :votes_count, :views_count, :created_time, :updated_time)

  json.user do
    json.(subject.user, :image, :nickname)
  end

  json.created_time_humane subject.created_at.to_s(:humane)

  json.attachment_images subject.attachment_images do |attachment_image|
    json.(attachment_image, :file)
  end

  json.discussions subject.discussions.order(votes_count: :desc, id: :desc) do |discussion|
    json.user do
      json.(discussion.user, :nickname, :image, :id_hash)
    end
    json.(discussion, :id, :content, :is_approved, :votes_count)
    json.subject_id subject.id
  end
end