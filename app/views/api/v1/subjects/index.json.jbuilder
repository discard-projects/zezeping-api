json.partial! 'partial/paginate_meta', object: @subjects
json.items @subjects do |subject|
  json.(subject, :id, :content, :enabled, :discussions_count, :votes_count, :views_count, :is_approved, :created_time, :updated_time)

  json.user do
    json.(subject.user, :image, :nickname)
  end

  json.created_time_humane subject.created_at.to_s(:humane)

  json.attachment_images subject.attachment_images do |attachment_image|
    json.(attachment_image, :file)
  end

  json.discussions subject.discussions.order(id: :desc).limit(3).order(votes_count: :desc) do |discussion|
    json.user do
      json.(discussion.user, :nickname, :image, :id_hash, :created_time)
    end
    json.(discussion, :id, :content, :discussable_id, :is_approved, :votes_count)
    json.subject_id subject.id
    json.created_time_humane discussion.created_at.to_s(:humane)
  end
end