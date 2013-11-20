require 'spec_helper'

describe ListsController do
  let!(:user) { User.create(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password")}
  let!(:list) { List.new(item1: "Ninja Turtle", user_id: user.id)}


  it "#index" do
    get :index
    response.status.should eq(200)
  end

  it "#new" do
    get :new, user_id: user.id
    response.status.should eq(200)
  end

  context "#create" do
    it "creates a new list with valid params" do
      expect {
        post :create, user_id: user.id, list: { item1: list.item1, user_id: user.id }
      }.to change{ List.count }.by(1)
    end

    it "does not create a new list with invalid params" do
      expect {
        post :create, user_id: user.id, list: { item1: "" }
      }.to_not change{ List.count }
    end
  end

  it "#show" do
    list = List.create(item1: "Ninja Turtle")
    get :show, user_id: user.id, id: list.id
    response.status.should eq(200)
  end
end