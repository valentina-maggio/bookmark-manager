feature 'can add bookmarks' do
  scenario 'adding a new bookmark' do
    visit '/'
    click_button('Add bookmark')
    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('title', with: 'Makers')
    click_button('Save')
    expect(page).to have_content 'Makers'
  end
end