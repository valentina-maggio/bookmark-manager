feature 'can view bookmarks' do
  scenario 'seeing all the bookmarks' do 
    visit '/bookmarks/index'
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
