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

  it "can log in" do
    visit root_path
    fill_in "sign_in_email", with: user.email
    fill_in "sign_in_password", with: user.password
    click_button("Sign In")
    expect(page).to have_content("Welcome, #{user.first_name}!")
  end

  it "should redirect root path if previously signed in" do
    visit root_path
    fill_in "sign_in_email", with: user.email
    fill_in "sign_in_password", with: user.password
    click_button("Sign In")
    visit root_path
    expect(page).to have_content("Welcome, #{user.first_name}!")
  end
end