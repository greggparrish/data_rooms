require 'rails_helper'

RSpec.describe "doctrees/edit", type: :view do
  before(:each) do
    @doctree = assign(:doctree, Doctree.create!(
      :document_id => 1,
      :folder_id => 1
    ))
  end

  it "renders the edit doctree form" do
    render

    assert_select "form[action=?][method=?]", doctree_path(@doctree), "post" do

      assert_select "input#doctree_document_id[name=?]", "doctree[document_id]"

      assert_select "input#doctree_folder_id[name=?]", "doctree[folder_id]"
    end
  end
end
