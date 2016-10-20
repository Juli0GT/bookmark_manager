require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb(:index)
  end

  post "/" do
    Link.create(title: params[:bookmark_title] , url: params[:bookmark_url])
    redirect "/"
  end

  get "/add" do
    erb :add
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
