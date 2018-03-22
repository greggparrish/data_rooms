require 'rails_helper'

RSpec.describe "doctrees/new", type: :view do
  before(:each) do
    assign(:doctree, Doctree.new(
      :document_id => 1,
      :folder_id => 1
    ))
  end

  it "renders new doctree form" do
    render

    assert_select "form[action=?][method=?]", doctrees_path, "post" do

      assert_select "input#doctree_document_id[name=?]", "doctree[document_id]"

      assert_select "input#doctree_folder_id[name=?]", "doctree[folder_id]"
    end
  end
end
