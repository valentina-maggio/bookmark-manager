feature 'testing infrustracture' do
  scenario 'it returns hello world on /' do
    visit '/'
    expect(page).to have_content 'Hello, world'
  end
end