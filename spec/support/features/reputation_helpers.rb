# spec/support/features/reputation_helpers.rb
module Features
  module ReputationHelpers
  	def check_idea_rep(idea,val)
  		selector = ".idea-#{idea.id}-local-rep"

  		visit url_for(@idea)
	    click_link "Reputation"
	    save_and_open_page
	    selector.should have_content("#{val}")
  	end
  end
end
