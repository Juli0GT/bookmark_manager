ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb(:index)
  end

  post "/" do
    link = Link.create(title: params[:bookmark_title] , url: params[:bookmark_url])
    tag = Tag.create(name: params[:bookmark_tag])
    LinkTag.create(:link => link, :tag => tag)
    redirect "/"
  end

  get "/add" do
    erb :add
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
