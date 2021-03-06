require 'spec_helper'

describe "User" do
  let!(:user) { FactoryGirl.create(:user) }
  
  it "can sign up" do
    visit root_path
    fill_in "user_first_name", with: "Stephanie"
    fill_in "user_last_name", with: "King"
    fill_in "user_email", with: "stephanie@stephanie.com"
    fill_in "user_password", with: "password"
    select("King", from: "user_family_group")
    click_button("Sign Up")
    expect(page).to have_content("Welcome, Stephanie!")
  end

  it "can log in" do
    visit root_path
    fill_in "sign_in_first_name", with: user.first_name
    fill_in "sign_in_email", with: user.email
    fill_in "sign_in_password", with: user.password
    click_button("Sign In")
    expect(page).to have_content("Welcome, #{user.first_name}!")
  end

  it "can log in with all caps name" do
    visit root_path
    fill_in "sign_in_first_name", with: user.first_name.upcase
    fill_in "sign_in_email", with: user.email
    fill_in "sign_in_password", with: user.password
    click_button("Sign In")
    expect(page).to have_content("Welcome, #{user.first_name}!")
  end

  it "should redirect root path if previously signed in" do
    visit root_path
    fill_in "sign_in_first_name", with: user.first_name
    fill_in "sign_in_email", with: user.email
    fill_in "sign_in_password", with: user.password
    click_button("Sign In")
    visit root_path
    expect(page).to have_content("Welcome, #{user.first_name}!")
  end
end