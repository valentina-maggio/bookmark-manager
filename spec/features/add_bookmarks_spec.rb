feature 'can add bookmarks' do
  scenario 'adding a new bookmark' do
    visit '/'
    click_button('Add bookmark')
    fill_in('url', with: 'abc.com')
    click_button('Save')
    expect(page).to have_content 'abc.com'
  end
end