require 'spec_helper'

describe "User" do
  let!(:user) { User.create(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password", family_group: "Nugent/Lim/Saito")}

  it "can update their password", js: true do
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