require 'bookmark'
require 'database_helpers'

describe Bookmark do
  
  let(:comment_class) { double(:comment_class) }

  describe '#all' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.last.url).to eq 'http://www.google.com'
    end
  end

  describe '#create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      persisted_data = persisted_data(id: bookmark.id, table: 'bookmarks')

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Google'
      expect(bookmark.url).to eq 'http://www.google.com'
    end

    it 'does not create a new bookmark if the url is invalid' do
      bookmark = Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
      expect(bookmark).not_to be_a Bookmark
    end
  end

  describe '#delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all).to be_empty
    end
  end

  describe '#update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      updated_bookmark = Bookmark.update(id: bookmark.id, title: 'GO', url: 'http://www.google.com')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.title).to eq 'GO'
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.url).to eq 'http://www.google.com'
    end
  end

  describe '#find' do
    it 'finds a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      
      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.title).to eq 'Google'
      expect(result.url).to eq 'http://www.google.com'
      expect(result.id).to eq bookmark.id
    end
  end

  describe '#comments' do
    it 'calls .where on the Comment class' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)
  
      bookmark.comments(comment_class)
    end
  end
end

