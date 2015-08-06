require 'rails_helper'

RSpec.describe "divisions/new", type: :view do
  before(:each) do
    assign(:division, Division.new())
  end

  it "renders new division form" do
    render

    assert_select "form[action=?][method=?]", divisions_path, "post" do
    end
  end
end
