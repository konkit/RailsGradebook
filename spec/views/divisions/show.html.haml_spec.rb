require 'rails_helper'

RSpec.describe "divisions/show", type: :view do
  before(:each) do
    @division = assign(:division, Division.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
