ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

enable :sessions
  get '/' do
    erb(:index)
  end

  post '/new_user' do
    user = User.create(email: params[:email], password: params[:pasword])
    User.user_count
    session[:email] = user.email
    @password = params[:pasword]
    redirect '/links'
  end

  get '/links' do

    @email = session[:email]
    # p @email
    @links = Link.all
    erb(:links)
  end

  get "/add" do
    erb :add
  end

  post "/tag" do
    tag = Tag.first(name: params[:filter_tag])
    @links = tag.links
    erb :links
  end

  post "/links" do
    link = Link.create(title: params[:bookmark_title] , url: params[:bookmark_url])
    tags = params[:bookmark_tag].split(" ")
    tags.each do |each_tag|
      new_tag = "#" + each_tag
      tag = Tag.first_or_create(name: new_tag)
        LinkTag.create(:link => link, :tag => tag)
    end
    redirect "/links"
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
