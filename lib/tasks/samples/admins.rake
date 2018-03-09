namespace :samples do
  task admins: :environment do
    Admin.find_or_create_by(email: 'swfeiyang@gmail.com') do |admin|
      admin.password = 'mars1234'
      admin.confirmed_at = Time.now
    end

    Admin.find_or_create_by(email: 'zwtao90@gmail.com') do |admin|
      admin.password = 'zwt@zezeping'
      admin.confirmed_at = Time.now
    end
  end
end