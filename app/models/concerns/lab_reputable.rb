module LabReputable
	extend ActiveSupport::Concern

  def update_lab_evaluation(value, evaluator)

  	# set eval to any prior evaluation by this user else create a new one
  	eval = evaluator.voted_for?(self)
 		eval = LabEvaluation.new unless eval

  	eval.value = value
  	eval.content = self
  	eval.content_type = self.class.to_s
  	eval.evaluator_id = evaluator.id
  	eval.content_creator_id = self.user.id
  	eval.save!

    self.user.update_lab_rep_points #update points for content creator 
    evaluator.update_lab_rep_points unless self.user == evaluator
  end

  def lab_rep
    evaluations = LabEvaluation.where(content: self, content_type: self.class.to_s)
    rep = 0
    evaluations.each do |e|
    	rep += e.value
    end

    return rep
  end

  def add_first_vote
  	update_lab_evaluation(1,self.user)
  end

  def local_reputation
    evals       = LabEvaluation.where(content:self)
    user_points = Array.new

    evals.each do |e|
      user_points << [User.find(e.content_creator_id), e.weighted_value_for_content_creator]
    end

    return user_points
  end
end