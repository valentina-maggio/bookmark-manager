feature "Can delete a bookmark" do
  scenario "Deleting a bookmark" do
    Bookmark.create(title: "ABC", url: "abc.com")
    visit("/")
    click_button("List bookmarks")
    click_button("Delete")
    expect(page).to_not have_content("ABC")
  end
end