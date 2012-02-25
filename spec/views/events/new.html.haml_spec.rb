require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :Status => nil,
      :Service => nil,
      :timestamp => "MyString",
      :message => "MyString"
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_Status", :name => "event[Status]"
      assert_select "input#event_Service", :name => "event[Service]"
      assert_select "input#event_timestamp", :name => "event[timestamp]"
      assert_select "input#event_message", :name => "event[message]"
    end
  end
end
