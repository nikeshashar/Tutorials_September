require 'spec_helper' 

feature "User signs out" do 

  before(:each) do 
    User.create(email: "user@example.com", password: "12345678", password_confirmation: "12345678")
  end

  scenario "while being signed in" do 
    sign_in('user@example.com', '12345678')
    click_button 'Sign out'
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, user@example.com")
  end

  
end