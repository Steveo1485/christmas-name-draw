require 'spec_helper'

describe "User" do
  let!(:user) { User.create(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password")}
  
  it "can sign up" do
    visit root_path
    fill_in "user_first_name", with: "Stephanie"
    fill_in "user_last_name", with: "King"
    fill_in "user_email", with: "stephanie@stephanie.com"
    fill_in "user_password", with: "password"
    click_button("Sign Up")
    expect(page).to have_content("Welcome, Stephanie!")
  end

  it "can create a new list" do
    visit user_lists_path(user.id)
    click_link "Create New List"
    fill_in "list_item1", with: "Ninja Turtle"
    click_button("Submit List")
    expect(page).to have_content("Ninja Turtle")
  end
end