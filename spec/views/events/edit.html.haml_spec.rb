require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :Status => nil,
      :Service => nil,
      :timestamp => "MyString",
      :message => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_Status", :name => "event[Status]"
      assert_select "input#event_Service", :name => "event[Service]"
      assert_select "input#event_timestamp", :name => "event[timestamp]"
      assert_select "input#event_message", :name => "event[message]"
    end
  end
end
