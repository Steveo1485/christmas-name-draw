require 'spec_helper'

describe UsersController do
  let!(:user) { User.new(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password", family_group: "Nugent/Lim/Saito")}
  let!(:valid_user) { User.create(first_name: "Derek", last_name: "Dragseth", email: "derek@derek.com", password: "password", family_group: "Dragseth")}

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
                              password: user.password,
                              family_group: user.family_group}
      }.to change{ User.count }.by(1)
    end

    it "does not create a new user with invalid params" do
      expect {
        post :create, user: { first_name: "",
                              last_name: user.last_name,
                              email: user.email,
                              password: user.password}
      }.to_not change{ User.count }
    end
  end

  context "#sign_in" do
    it "signs in user with valid credentials" do
      post :sign_in, user: {first_name: valid_user.first_name, email: valid_user.email, password: valid_user.password}
      expect(session[:user_id]).to eq(valid_user.id)
    end

    it "does not sign in user with invalid credentials" do
      post :sign_in, user: {email: valid_user.email, password: "foo"}
      expect(session[:user_id]).to eq(nil)
    end
  end

  it "#sign_out" do
    post :sign_out, id: user.id
    expect(session[:user_id]).to eq(nil)
  end

  context "#update" do
    it "doesn't a user with invalid params" do
      put :update, id: valid_user.id, user: { first_name: "Steveo" }
      response.status.should eq(302)
    end

    it "doesn't a user with invalid params" do
      put :update, id: valid_user.id, user: { first_name: "" }
      expect(valid_user.first_name).to eq(valid_user.first_name)
    end
  end

  it "#show" do
    get :show, id: valid_user.id
    response.status.should eq(200)
  end
end