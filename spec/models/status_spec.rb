require 'spec_helper'


describe Status do
  it { should validate_presence_of(:name) }
  context "with an existing status"  do
    before :each do
       Status.create!({name: "test"})
    end
    it { should validate_uniqueness_of(:name) }
  end
end