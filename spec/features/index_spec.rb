feature 'testing infrustracture' do
  scenario 'it returns Bookmark Manager on /' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'it can click on button List' do
    visit '/'
    expect(page).to have_button 'List bookmarks'
  end

  scenario 'it can click on button Add' do
    visit '/'
    expect(page).to have_button 'Add bookmark'
  end

end