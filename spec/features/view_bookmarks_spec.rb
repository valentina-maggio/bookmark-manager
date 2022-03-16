require 'pg'

feature 'can view bookmarks' do
  scenario 'seeing all the bookmarks' do 

    connection = PG.connect(dbname: 'bookmark_manager_test')
      
    Bookmark.create(url: "http://www.makersacademy.com")
    Bookmark.create(url: "http://www.destroyallsoftware.com")
    Bookmark.create(url: "http://www.google.com")

    visit '/bookmarks/index'

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
