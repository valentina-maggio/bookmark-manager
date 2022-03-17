feature 'can delete a bookmark' do
  scenario 'deleting a bookmark' do
    Bookmark.create(title: 'Google', url: 'http://www.google.com')
    visit('/')
    click_button('List bookmarks')
    click_button('Delete')
    expect(page).to_not have_content('Google')
  end
end