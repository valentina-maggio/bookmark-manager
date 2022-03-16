require 'pg'

feature 'can view bookmarks' do
  scenario 'seeing all the bookmarks' do 

    connection = PG.connect(dbname: 'bookmark_manager_test')
      
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "DAS")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit '/'
    click_button('List bookmarks')

    expect(page).to have_link "Makers", href: "http://www.makersacademy.com"
    expect(page).to have_link "DAS", href: "http://www.destroyallsoftware.com"
    expect(page).to have_link "Google", href: "http://www.google.com"
  end
end
