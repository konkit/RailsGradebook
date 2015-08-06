require 'rails_helper'

RSpec.describe "divisions/edit", type: :view do
  before(:each) do
    @division = assign(:division, Division.create!())
  end

  it "renders the edit division form" do
    render

    assert_select "form[action=?][method=?]", division_path(@division), "post" do
    end
  end
end
