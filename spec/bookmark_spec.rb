require 'bookmark'

describe Bookmark do
  
  describe '#all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'DAS');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

      bookmarks = Bookmark.all
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.last.url).to eq 'http://www.google.com'
    end
  end

  describe '#create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'abc.com', title: 'ABC')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'ABC'
      expect(bookmark.url).to eq 'abc.com'
    end
  end

  describe '#delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'abc.com', title: 'ABC')
      expect(bookmark.title).to eq 'ABC'
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all).to be_empty
    end
  end

  describe '#update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(url: 'abc.com', title: 'ABC')
      expect(bookmark.title).to eq 'ABC'
      Bookmark.update(id: bookmark.id, title: 'CCC', url: 'abc.com')
      expect(Bookmark.all.first.title).to eq 'CCC'
    end
  end

  describe '#find' do
    it 'finds a bookmark' do
      bookmark = Bookmark.create(url: 'abc.com', title: 'ABC')
      expect(bookmark.title).to eq 'ABC'
      find = Bookmark.find(id: bookmark.id)
      expect(find).to be_a Bookmark
      expect(find.title).to eq 'ABC'
      expect(find.url).to eq 'abc.com'
      expect(find.id).to eq bookmark.id
    end
  end
end

