namespace :samples do
  task regions: :environment do
    region = Region.find_or_create_by(name: 'Manila')
    region.children.find_or_create_by(name: 'Makati')
  end
end
