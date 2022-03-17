feature "Can update a bookmark" do
  scenario "Updating a bookmark" do
    Bookmark.create(title: "ABC", url: "abc.com")
    visit("/")
    click_button("List bookmarks")
    click_button("Update")
    fill_in("title", with: "CCC")
    fill_in("url", with: "abc.com")
    click_button("Save changes")
    expect(page).to_not have_content("ABC")
    expect(page).to have_content("CCC")
  end
end