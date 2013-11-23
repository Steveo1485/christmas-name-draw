require 'spec_helper'

describe List do
  it { should belong_to(:user) }
  it { should validate_presence_of(:item1) }
  it { should have_many(:items) }
end