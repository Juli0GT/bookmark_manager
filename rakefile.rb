require 'data_mapper'
require './app/app.rb'


task :auto_upgrade do
  DataMapper.auto_upgrade!
end


task :auto_migrate do
  DataMapper.auto_migrate!
end
