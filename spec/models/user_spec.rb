require 'spec_helper'

describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_uniqueness_of(:first_name) }
end