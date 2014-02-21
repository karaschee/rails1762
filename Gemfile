source 'http://ruby.taobao.org'

ruby '2.0.0'
gem 'rails', '4.0.2'

gem 'sass-rails', '4.0.1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'will_paginate', '3.0.4'
gem 'kaminari'
gem 'mini_magick'
gem 'carrierwave'
gem 'simple_form'


group :development, :test do
  gem 'sqlite3', '1.3.8'

  # rspec
  gem 'rspec-rails', '2.13.1' # 封装 RSpec 的程序，还包含了一些专为 Rails 提供的功能
  gem 'guard-rspec', '2.5.0'
  gem "factory_girl_rails", "4.2.1" # 把 Rails 生成测试数据默认使用的固件换成更好用的预构件

  # spork
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
end

group :test do
  gem 'libnotify', '0.8.0'
  gem 'selenium-webdriver', '2.35.1' # 结合 Capybara 测试基于 JavaScript 的交互操作
  gem 'capybara', '2.1.0'
  gem "faker", "1.1.2"
  gem "launchy", "2.3.0" # 这个 gem 的功能只有一个，但做的很好，如果需要，它会打开系统的默认浏览器，显示应用程序当前渲染的页面。调试测试时特别有用
  gem "database_cleaner", "1.0.1" # 清理“测试数据库”，确保 RSpec 中的测试用例运行于一块净土之上
  gem "shoulda-matchers", "~> 2.2.0" # Shoulda 是一个匹配器扩展代码库，可以更轻松地测试常规功能。添加这样一个额外的依赖库，就可以把之前要使用三行四行甚至五行的测试精简到只需一到两行。
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end