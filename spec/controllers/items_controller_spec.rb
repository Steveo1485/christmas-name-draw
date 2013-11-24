require 'spec_helper'

describe ItemsController do
  let!(:user) { User.create(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password", family_group: "Nugent/Lim/Saito")}
  let!(:list) { List.create(user_id: user.id)}
  let!(:item) { Item.create(item: "Ninja Turtle", list_id: list.id)}
  
  context "#create" do
    it "creates a new item with valid params" do
      expect {
        post :create, user_id: user.id, list_id: list.id, item: { item: "Ninja Turtle" }
      }.to change{ Item.count }.by(1)
    end

    it "does not create a new list with invalid params" do
      expect {
        post :create, user_id: user.id, list_id: list.id, item: { item: "" }
      }.to_not change{ List.count }
    end
  end

  it "#destroy" do
    expect {
      delete :destroy, user_id: user.id, list_id: list.id, id: item.id
    }.to change{ Item.count }.by(-1)
  end
end