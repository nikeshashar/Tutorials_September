require 'spec_helper'

feature "User forgets password" do 
  before(:each) do 
    User.create(email: "nikeshashar@gmail.com", password: 'test', password_confirmation: 'test')
  end

  scenario "requests for password reset" do 
    visit '/users/forgot'
    expect(page).to have_content("Forgot password?")
  end

  scenario "user enters right email address" do 
    visit '/users/forgot'
    fill_in 'email', with: "nikeshashar@gmail.com"
    click_on 'Reset Password'
    expect(page).to have_content("Password reset link sent to your email address")  
  end

  scenario "user enters email that is not registered" do 
    visit '/users/forgot'
    fill_in 'email', with: "wrongtest@test.com"
    click_on 'Reset Password'
    expect(page).to have_content("Sorry, wrongtest@test.com is not registered. Please sign up first!")
  end

  scenario "successful reset" do
    visit '/users/forgot'
    fill_in 'email', with: "nikeshashar@gmail.com"
    click_on 'Reset Password'
    allow(Notifications).to receive(:send_email).and_return("success")
    expect(page).to have_content("Password reset email sent to nikeshashar@gmail.com")
  end

end
