require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

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
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmark_list'
  end

  post '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect 'bookmarks/index'
  end

  run! if app_file == $0
end
