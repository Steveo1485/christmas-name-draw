require 'spec_helper'

describe "User" do
  let!(:user) { User.create(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password")}
  
  it "can create a new list", js: true do
    visit user_lists_path(user.id)
    click_link "Create New List"
    fill_in "list_item1", with: "Ninja Turtle"
    click_button("Submit List")
    expect(page).to have_content("Ninja Turtle")
  end
end