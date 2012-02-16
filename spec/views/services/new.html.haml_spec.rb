require 'spec_helper'

describe "services/new" do
  before(:each) do
    assign(:service, stub_model(Service,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => services_path, :method => "post" do
      assert_select "input#service_name", :name => "service[name]"
      assert_select "input#service_description", :name => "service[description]"
    end
  end
end
