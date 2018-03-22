require 'rails_helper'

RSpec.describe "permissions/new", type: :view do
  before(:each) do
    assign(:permission, Permission.new(
      :user_id => 1,
      :document_id => 1
    ))
  end

  it "renders new permission form" do
    render

    assert_select "form[action=?][method=?]", permissions_path, "post" do

      assert_select "input#permission_user_id[name=?]", "permission[user_id]"

      assert_select "input#permission_document_id[name=?]", "permission[document_id]"
    end
  end
end
