require 'rails_helper'

feature "the user sign in process" do 
  
  scenario "with valid input" do
    jane = Fabricate(:user, email: 'janesmith@example.com', password: 'jane', full_name: 'jane smith')
    sign_in(jane)
    expect(page).to have_content 'successfully'
  end  

  scenario "with invalid input" do
    visit sign_in_path
    fill_in 'Email', with: 'janesmith@error.com'
    fill_in 'Password', with: 'error'
    click_button 'Sign in'
    expect(page).to have_content 'incorrect'
  end  
end