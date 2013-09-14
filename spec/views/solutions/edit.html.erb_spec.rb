require 'spec_helper'

describe "answers/edit" do
  include Devise::TestHelpers
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :brief => "MyText"
    ))
  end

  it "renders the edit answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do
      assert_select "textarea#answer_brief[name=?]", "answer[brief]"
    end
  end
end
