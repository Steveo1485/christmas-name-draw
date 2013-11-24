require 'spec_helper'

describe ListsController do
  let!(:user) { User.create(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password")}
  let!(:list) { List.new(user_id: user.id)}


  it "#index" do
    get :index, user_id: user.id
    response.status.should eq(200)
  end

  it "creates a new list with valid params" do
    expect {
      post :create, user_id: user.id, list: { user_id: user.id }
    }.to change{ List.count }.by(1)
  end

  it "#show" do
    list = List.create(user_id: user.id)
    get :show, user_id: user.id, id: list.id
    response.status.should eq(200)
  end
end