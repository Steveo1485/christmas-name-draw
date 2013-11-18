require 'spec_helper'

describe ListsController do
  let!(:list) { List.new(item1: "Ninja Turtle")}

  context "#create" do
    it "creates a new list with valid params" do
      expect {
        post :create, list: { item1: list.item1 }
      }.to change{ List.count }.by(1)
    end
  end
end