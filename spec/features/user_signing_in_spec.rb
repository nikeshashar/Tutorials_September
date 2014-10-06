require 'spec_helper' 
require_relative 'helpers/session'

include SessionHelpers

feature "User signs in" do 

  before(:each) do 
    User.create(email: "user@example.com", password: "12345678", password_confirmation: "12345678")
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, user@example.com")
    sign_in("user@example.com", "12345678")
    expect(page).to have_content("Welcome, user@example.com")
  end

  scenario "with incorrect credentials" do 
    visit '/'
    expect(page).not_to have_content("Welcome, user@example.com")
    sign_in("user@example.com", "wrong")
    expect(page).not_to have_content("Welcome, user@example.com")
  end


end
