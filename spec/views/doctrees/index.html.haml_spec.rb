require 'rails_helper'

RSpec.describe "doctrees/index", type: :view do
  before(:each) do
    assign(:doctrees, [
      Doctree.create!(
        :document_id => 1,
        :folder_id => 2
      ),
      Doctree.create!(
        :document_id => 1,
        :folder_id => 2
      )
    ])
  end

  it "renders a list of doctrees" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
