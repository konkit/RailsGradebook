require 'rails_helper'

RSpec.describe "divisions/index", type: :view do
  before(:each) do
    assign(:divisions, [
      Division.create!(),
      Division.create!()
    ])
  end

  it "renders a list of divisions" do
    render
  end
end
