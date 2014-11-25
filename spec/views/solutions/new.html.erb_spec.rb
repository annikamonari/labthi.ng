require 'rails_helper'

describe "answers/new" do
  include Devise::TestHelpers
  before(:each) do
    assign(:answer, stub_model(Answer,
      :brief => "MyText"
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answers_path, "post" do
      assert_select "textarea#answer_brief[name=?]", "answer[brief]"
    end
  end
end
