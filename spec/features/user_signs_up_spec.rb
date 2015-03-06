require 'rails_helper'

feature "the user sign up process" do 
  
  scenario "with valid input" do
    visit sign_up_path
    fill_in 'Full Name', :with => 'Mary Poppins'
    fill_in 'Email', :with => 'marypoppins@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'successfully'
  end  

  scenario "with invalid input" do
    visit sign_up_path
    fill_in 'Full Name', :with => 'Mary Poppins'
    fill_in 'Email', :with => ''
    fill_in 'Password', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'errors'
  end 

  scenario "with existing user" do
    jane = User.create(:email => 'janesmith@example.com', :password => 'jane', :full_name => 'jane smith')
    visit sign_up_path
    fill_in 'Full Name', :with => 'jane smith'
    fill_in 'Email', :with => 'janesmith@example.com'
    fill_in 'Password', :with => 'jane'
    click_button 'Sign up'
    expect(page).to have_content 'errors'
  end   
end