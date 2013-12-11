module LabReputable
	extend ActiveSupport::Concern

  def update_lab_evaluation(value, evaluator)

  	# set eval to any prior evaluation by this user else create a new one
  	eval = evaluator.up_voted_for?(self)
  	eval = evaluator.down_voted_for?(self) unless eval
 		eval = LabEvaluation.new unless eval

  	eval.value = value
  	eval.content = self
  	eval.content_type = self.class.to_s
  	eval.evaluator_id = evaluator.id
  	eval.content_creator_id = self.user.id
  	eval.save!

    evaluator.update_lab_rep_points
    self.user.update_lab_rep_points #update points for content creator 
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
    self.user.update_lab_rep_points
  end

  def local_reputation
    evals = LabEvaluation.where(content:self)

    points = 0
    evals.each do |e|
      points += e.weighted_value_for_content_creator
    end

    return points
  end
end