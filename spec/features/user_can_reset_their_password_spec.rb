require 'spec_helper'

describe "User" do
  let!(:user) { FactoryGirl.create(:user) }

  it "can update their password" do
    visit root_path
    click_link "Update Your Password"
    fill_in "first_name", with: user.first_name
    fill_in "email", with: user.email
    fill_in "password", with: "newpassword"
    fill_in "confirm_password", with: "newpassword"
    click_button("Update Password")
    fill_in "sign_in_first_name", with: user.first_name
    fill_in "sign_in_email", with: user.email
    fill_in "sign_in_password", with: "newpassword"
    click_button("Sign In")
    expect(page).to have_content(user. first_name)
  end
end