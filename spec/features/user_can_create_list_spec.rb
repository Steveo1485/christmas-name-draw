require 'spec_helper'

describe "User" do
  it "can create a new list", :js => true do
    visit root_path
    click_link "Create New List"
    fill_in "list_item1", with: "Ninja Turtle"
    click_button("Submit List")
    expect(page).to have_content("Ninja Turtle")
  end
end