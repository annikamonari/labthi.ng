module LabReputable
	extend ActiveSupport::Concern


  def update_lab_evaluation(value, evaluator)
  	eval = LabEvaluation.new
  	eval.value = value
  	eval.content = self
  	eval.content_type = self.class.to_s
  	eval.evaluator_id = evaluator.id
  	eval.content_creator_id = self.user.id
  	eval.save!
  end

	def lab_rep
    evaluations = LabEvaluation.where(content: self)
    rep = 0
    puts evaluations.first.value if evaluations.first != nil
    evaluations.each do |e|
    	rep += e.value
    end

    return rep
  end

  def add_first_vote
  	update_lab_evaluation(1,self.user)
  end
end