require 'rails_helper'

RSpec.describe "doctrees/show", type: :view do
  before(:each) do
    @doctree = assign(:doctree, Doctree.create!(
      :document_id => 1,
      :folder_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
