require 'rails_helper'

feature 'user redirected to own path on login' do

  scenario 'user should be redirected to own path when logging in' do
    new_user = create(:user)
    visit new_session_path
    fill_in "username", with: "MyString"
    fill_in "password", with: "Foobar"
    click_button("Log in")
    expect(current_path).to eq(user_path(new_user))
  end
end

feature 'user can add shoes' do

  before do
    new_user = create(:user)
    visit new_session_path
    fill_in "username", with: "MyString"
    fill_in "password", with: "Foobar"
    click_button("Log in")
  end

  scenario 'user should see shoes they have added on their list' do
    click_link("Add a pair of shoes")
    fill_in "shoe[brand]", with: "brandy"
    fill_in "shoe[model]", with: "newest"
    click_button("Create Shoe")
    expect(page).to have_content("brandy")
  end
end
