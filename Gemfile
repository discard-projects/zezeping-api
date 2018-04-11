source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# auth
gem 'devise', '~> 4.4'
gem 'devise_token_auth'
# facebook part auth
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

gem 'timequery', github: 'wuyuedefeng/timequery'
gem 'footprintable', github: 'wuyuedefeng/footprintable'
# 表单
gem 'reform'
gem 'reform-rails'
# 分页
gem 'kaminari'
# 搜索
gem 'ransack'
gem 'base_resource', github: 'wuyuedefeng/base-resource'
# tree
gem 'ancestry'
# position
gem 'acts_as_list'
# 上传组件
gem 'carrierwave'
gem 'carrierwave-aliyun'
gem 'mini_magick'
# 限流等
gem 'rack-attack'
# AASM is a continuation of the acts-as-state-machine rails plugin, built for plain Ruby objects
gem 'aasm'
# geocoder
gem 'geocoder'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails-erd', require: false
  # better errors
  gem "better_errors"
  gem "binding_of_caller"
  # deploy
  gem 'mina'
  gem 'mina-puma', :require => false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
