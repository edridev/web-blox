require 'rails_helper'

RSpec.describe "tetetetes/show", type: :view do
  before(:each) do
    @tetetete = assign(:tetetete, Tetetete.create!(
      name: "Name",
      full_name: "Full Name",
      address: "Address",
      number: "Number",
      district: "District",
      city: "City",
      state: "State",
      country: "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
  end
end
