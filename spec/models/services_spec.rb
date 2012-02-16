describe Service do
  it { should validate_presence_of(:name) }
  context "with an existing service"  do
    before :each do
       Service.create!({name: "test"})
    end
    it { should validate_uniqueness_of(:name) }
  end
end