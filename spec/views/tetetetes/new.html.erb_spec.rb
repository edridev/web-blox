require 'rails_helper'

RSpec.describe "tetetetes/new", type: :view do
  before(:each) do
    assign(:tetetete, Tetetete.new(
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

  it "renders new tetetete form" do
    render

    assert_select "form[action=?][method=?]", tetetetes_path, "post" do

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
