require 'pg'
require 'database_connection'

class Bookmark
  attr_reader :title, :url, :id

  def initialize(title:, url:, id:) 
    @title = title
    @url = url
    @id = id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map { |bookmark| Bookmark.new(title: bookmark['title'], url: bookmark['url'], id: bookmark['id']) } 
  end

  def self.create(url:, title:)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    result = DatabaseConnection.query("DELETE FROM bookmarks WHERE id = $1;", [id])
  end

  def self.update(id:, title:, url:)
    result = DatabaseConnection.query("UPDATE bookmarks SET title = $1, url = $2 WHERE id = $3;", [title, url, id])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = $1;", [id])
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
end
