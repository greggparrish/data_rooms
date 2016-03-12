require 'rails_helper'

RSpec.describe "permissions/index", type: :view do
  before(:each) do
    assign(:permissions, [
      Permission.create!(
        :user_id => 1,
        :document_id => 2
      ),
      Permission.create!(
        :user_id => 1,
        :document_id => 2
      )
    ])
  end

  it "renders a list of permissions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
