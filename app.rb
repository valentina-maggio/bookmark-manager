require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require 'uri'
require_relative './lib/bookmark'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Flash
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
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks/index'
  end

  get '/bookmarks/index' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmark_list'
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.find(id: params[:id])
    @bookmark_id = params[:id]
    erb :'bookmarks/update'
  end

  patch '/bookmarks/:id/updated' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks/index'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks/index'
  end

  run! if app_file == $0
end
