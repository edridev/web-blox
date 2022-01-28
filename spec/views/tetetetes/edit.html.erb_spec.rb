require 'rails_helper'

RSpec.describe "tetetetes/edit", type: :view do
  before(:each) do
    @tetetete = assign(:tetetete, Tetetete.create!(
      name: "MyString",
      full_name: "MyString",
      address: "MyString",
      number: "MyString",
      district: "MyString",
      city: "MyString",
      state: "MyString",
      country: "MyString"
    ))
  end

  it "renders the edit tetetete form" do
    render

    assert_select "form[action=?][method=?]", tetetete_path(@tetetete), "post" do

      assert_select "input[name=?]", "tetetete[name]"

      assert_select "input[name=?]", "tetetete[full_name]"

      assert_select "input[name=?]", "tetetete[address]"

      assert_select "input[name=?]", "tetetete[number]"

      assert_select "input[name=?]", "tetetete[district]"

      assert_select "input[name=?]", "tetetete[city]"

      assert_select "input[name=?]", "tetetete[state]"

      assert_select "input[name=?]", "tetetete[country]"
    end
  end
end
