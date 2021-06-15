require 'rails_helper'

RSpec.describe "ideas/index", type: :view do
  before(:each) do
    assign(:ideas, [
      Idea.create!(
        idea: "MyText"
      ),
      Idea.create!(
        idea: "MyText"
      )
    ])
  end

  it "renders a list of ideas" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
