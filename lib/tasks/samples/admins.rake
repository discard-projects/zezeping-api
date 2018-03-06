namespace :samples do
  task admins: :environment do
    Admin.find_or_create_by(email: '578595193') do |admin|
      admin.password = 'mars1234'
      admin.confirmed_at = Time.now
    end
  end
end