require 'spec_helper'

describe "hotels/index.html.erb" do
  let(:hotel1){ Factory(:hotel, :name => "Waldorf") }
  let(:hotel2){ Factory(:hotel, :name => "Holiday Inn") }
  before do
  end
  it "shows all the hotels" do
    assign(:hotels, [hotel1, hotel2])

    render

    rendered.should match("Waldorf")
    rendered.should match("Holiday Inn")
  end
end