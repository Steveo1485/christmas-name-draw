require 'spec_helper'

describe "User" do
  let!(:user) { User.create(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password")}
  
  it "can create a new list" do
    visit root_path
    fill_in "sign_in_email", with: user.email
    fill_in "sign_in_password", with: user.password
    click_button("Sign In")
    click_link "Create Christmas List"
    expect(page).to have_button("Add Item")
  end

  it "can add item to list" do
    visit root_path
    fill_in "sign_in_email", with: user.email
    fill_in "sign_in_password", with: user.password
    click_button("Sign In")
    click_link "Create Christmas List"
    fill_in "item_item", with: "Ninja Turtle"
    click_button("Add Item")
    expect(page).to have_content("Ninja Turtle")
  end

  it "can remove an item from a list" do
    visit root_path
    fill_in "sign_in_email", with: user.email
    fill_in "sign_in_password", with: user.password
    click_button("Sign In")
    click_link "Create Christmas List"
    fill_in "item_item", with: "Ninja Turtle"
    click_button("Add Item")
    click_link("Remove from list")
    expect(page).not_to have_content("Ninja Turtle")
  end
end