feature 'testing infrustracture' do
  scenario 'it returns hello world on /' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end