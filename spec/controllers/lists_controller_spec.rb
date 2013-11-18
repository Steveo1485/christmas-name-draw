require 'spec_helper'

describe ListsController do
  let!(:list) { List.new(item1: "Ninja Turtle")}

  it "#index" do
    get :index
    response.status.should eq(200)
  end

  it "#new" do
    get :new
    response.status.should eq(200)
  end

  context "#create" do
    it "creates a new list with valid params" do
      expect {
        post :create, list: { item1: list.item1 }
      }.to change{ List.count }.by(1)
    end

    it "does not create a new list with invalid params" do
      expect {
        post :create, list: { item1: "" }
      }.to_not change{ List.count }
    end
  end
end