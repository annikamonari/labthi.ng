require 'spec_helper'

describe IdeaBuild do
  before (:each) do
    @idea_build = create(:idea_build)
  end

  it "creates a plan_component" do
    expect(@idea_build).to respond_to :plan_component
  end
end
