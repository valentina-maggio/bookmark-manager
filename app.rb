require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks/index' do
   p Bookmark.create(url: params[:url])
    redirect '/bookmarks/index'
  end

  get '/bookmarks/index' do
    ENV
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end


  run! if app_file == $0
end
