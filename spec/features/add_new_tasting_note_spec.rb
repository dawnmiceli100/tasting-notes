require 'rails_helper'

feature "the add new tasting note functionality" do 
  scenario "the user adds a tasting note for an existing wine and then for a new wine" do
    red = Fabricate(:wine_type, name: "Red") 
    wine1 = Fabricate(:wine, description: 'Red Wine One', vintage: 2002, wine_type: red)
    jane = User.create(:email => 'janesmith@example.com', :password => 'jane', :full_name => 'jane smith') 

    sign_in(jane)

    link_to_new_note_for_wine(wine1) 
    expect(page).to have_content wine1.description

    add_tasting_note("2013", "June", "15", "good", "my comments")
    expect(page).to have_content 'has been saved'

    visit(home_path) 
    expect(page).to have_content wine1.vintage.to_s + ' ' + wine1.description
   
    link_to_new_note_for_new_wine 
    expect(page).to have_content 'Add a New Wine'

    add_wine("Red", "This is my description", "2002")
    expect(page).to have_content 'has been successfully added'

    add_tasting_note("2010", "August", "10", "very good", "my comments")
    expect(page).to have_content 'has been saved'

    visit(home_path) 
    expect(page).to have_content "2002 This is my description"
    
  end

  def link_to_new_note_for_wine(wine)
    find("a[href='/wines/#{wine.id}/tasting_notes/new']").click
  end 

  def link_to_new_note_for_new_wine
    find("a[href='/wines/new']").click
  end 

  def add_tasting_note(year, month, day, quality, comments)
    page.select year, :from => 'tasting_note_tasting_date_1i'
    page.select month, :from => 'tasting_note_tasting_date_2i'
    page.select day, :from => 'tasting_note_tasting_date_3i'
    page.select quality, :from => 'tasting_note_quality'
    fill_in 'Comments', :with => comments
    click_button 'Add Tasting Note'
  end 

  def add_wine(type, description, vintage)
    page.select type, :from => 'wine_wine_type_id'
    fill_in 'wine_description', :with => description
    fill_in 'Vintage', :with => vintage
    click_button 'Add Wine' 
  end  

end