require 'rails_helper'

RSpec.describe "permissions/edit", type: :view do
  before(:each) do
    @permission = assign(:permission, Permission.create!(
      :user_id => 1,
      :document_id => 1
    ))
  end

  it "renders the edit permission form" do
    render

    assert_select "form[action=?][method=?]", permission_path(@permission), "post" do

      assert_select "input#permission_user_id[name=?]", "permission[user_id]"

      assert_select "input#permission_document_id[name=?]", "permission[document_id]"
    end
  end
end
