feature 'can update a bookmark' do
  scenario 'updating a bookmark' do
    Bookmark.create(title: 'Google', url: 'http://www.google.com')
    visit('/')
    click_button('List bookmarks')
    click_button('Update')
    fill_in('title', with: 'GO')
    fill_in('url', with: 'http://www.google.com')
    click_button('Save changes')
    expect(page).to_not have_content('Google')
    expect(page).to have_content('GO')
  end
end