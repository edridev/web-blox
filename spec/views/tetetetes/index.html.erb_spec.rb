require 'rails_helper'

RSpec.describe "tetetetes/index", type: :view do
  before(:each) do
    assign(:tetetetes, [
      Tetetete.create!(
        name: "Name",
        full_name: "Full Name",
        address: "Address",
        number: "Number",
        district: "District",
        city: "City",
        state: "State",
        country: "Country"
      ),
      Tetetete.create!(
        name: "Name",
        full_name: "Full Name",
        address: "Address",
        number: "Number",
        district: "District",
        city: "City",
        state: "State",
        country: "Country"
      )
    ])
  end

  it "renders a list of tetetetes" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Full Name".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "Number".to_s, count: 2
    assert_select "tr>td", text: "District".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "State".to_s, count: 2
    assert_select "tr>td", text: "Country".to_s, count: 2
  end
end
