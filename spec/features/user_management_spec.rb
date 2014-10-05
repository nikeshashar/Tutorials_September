require 'spec_helper'

feature 'User signs up' do 

  scenario "when being logged out" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, user@example.com")
    expect(User.first.email).to eq("user@example.com")
  end

  def sign_up(email = "user@example.com", password = "12345678")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end

end