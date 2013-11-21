require 'spec_helper'

describe UsersController do
  let!(:user) { User.new(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password")}
  
  it "#index" do
    get :index
    response.status.should eq(200)
  end

  it "#new" do
    get :new
    response.status.should eq(200)
  end

  context "#create" do
    it "creates a new user with valid params" do
      expect {
        post :create, user: { first_name: user.first_name,
                              last_name: user.last_name,
                              email: user.email,
                              password: user.password}
      }.to change{ User.count }.by(1)
    end
  end
end