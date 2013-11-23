require 'spec_helper'

describe Item do
  it { should belong_to(:list) }
  it { should validate_presence_of(:item) }
end