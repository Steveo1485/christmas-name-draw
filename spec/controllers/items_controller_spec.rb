require 'spec_helper'

describe ItemsController do
  let!(:user) { User.create(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password")}
  let!(:list) { List.create(user_id: user.id)}
  
  context "#create" do
    it "creates a new item with valid params" do
      expect {
        post :create, user_id: user.id, list_id: list.id, item: { item: "Ninja Turtle" }
      }.to change{ Item.count }.by(1)
    end

    xit "does not create a new list with invalid params" do
      expect {
        post :create, user_id: user.id, list: { item1: "" }
      }.to_not change{ List.count }
    end
  end
end