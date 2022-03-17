require 'bookmark'

describe Bookmark do
  
  describe '#all' do
    it 'returns all bookmarks' do
      Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all
      
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.last.url).to eq 'http://www.google.com'
    end
  end

  describe '#create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
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
      expect(bookmark.title).to eq 'Google'
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all).to be_empty
    end
  end

  describe '#update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      expect(bookmark.title).to eq 'Google'
      Bookmark.update(id: bookmark.id, title: 'GO', url: 'http://www.google.com')
      expect(Bookmark.all.first.title).to eq 'GO'
    end
  end

  describe '#find' do
    it 'finds a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      expect(bookmark.title).to eq 'Google'
      find = Bookmark.find(id: bookmark.id)
      expect(find).to be_a Bookmark
      expect(find.title).to eq 'Google'
      expect(find.url).to eq 'http://www.google.com'
      expect(find.id).to eq bookmark.id
    end
  end
end

