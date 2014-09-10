require 'spec_helper'

describe "User" do
  let!(:user) { FactoryGirl.create(:user) }
  
  it "update their info" do
    visit root_path
    fill_in "sign_in_first_name", with: user.first_name
    fill_in "sign_in_email", with: user.email
    fill_in "sign_in_password", with: user.password
    click_button("Sign In")
    click_link("Update Info")
    fill_in "user_first_name", with: "Steveo"
    click_button("Update Info")
    expect(page).to have_content("Welcome, Steveo!")
  end
end