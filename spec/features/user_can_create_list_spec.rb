require 'spec_helper'

describe "User" do
  let!(:user) { User.create(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password")}
  
  xit "can create a new list" do
    visit new_user_list_path(user.id)
    click_link "Create New List"
    fill_in "list_item1", with: "Ninja Turtle"
    click_button("Submit List")
    expect(page).to have_content("Ninja Turtle")
  end
end