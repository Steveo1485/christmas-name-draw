require 'spec_helper'

describe ItemsController do
  let!(:user) { User.create(first_name: "Steven", last_name: "Nugent", email: "steven@steven.com", password: "password")}
  let!(:list) { List.create(item1: "Ninja Turtle", user_id: user.id)}
  
  context "#create" do
    xit "creates a new item with valid params" do
      expect {
        post :create, user_id: user.id, list_id:  { item1: list.item1, user_id: user.id }
      }.to change{ List.count }.by(1)
    end

    xit "does not create a new list with invalid params" do
      expect {
        post :create, user_id: user.id, list: { item1: "" }
      }.to_not change{ List.count }
    end
  end
end