require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks/add_to_index' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks/index'
  end

  get '/bookmarks/index' do
    ENV
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmark_list'
  end


  run! if app_file == $0
end
