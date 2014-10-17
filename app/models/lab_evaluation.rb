class LabEvaluation < ActiveRecord::Base
  belongs_to :evaluator
  belongs_to :content_creator
  belongs_to :content, polymorphic: true


  def weighted_value_for_evaluator
    up_weight = {
      "Idea" => 0,
      "Question" => 0,
      "Answer" => 0,
      "Solution"=> 0,
      "Comment" => 0,
      "AdminTask" => 0
    }
    down_weight = {
      "Idea" => 2,
      "Question" => 1,
      "Answer" => 1,
      "Solution"=> 1,
      "Comment" => 0
    }

    type = self.content_type

    if self.value == -1
    	weight = down_weight[type]
    elsif self.value == 1
    	weight = up_weight[type]
    else
    	weight = 0
    end

    value = weight*(self.value)
    return value
  end

  def weighted_value_for_content_creator
    up_weight = {
      "Idea" => 5,
      "Question" => 2,
      "Answer" => 3,
      "Solution"=> 4,
      "Comment" => 1,
      "AdminTask" => 1
    }
    down_weight = {
      "Idea" => 4,
      "Question" => 1,
      "Answer" => 2,
      "Solution"=> 2,
      "Comment" => 1
    }

    type = self.content_type

    if self.value == -1
    	weight = down_weight[type]
    elsif self.value == 1
    	weight = up_weight[type]
    elsif User.find(self.evaluator_id).admin
      weight = 1
    else  
    	weight = 0
    end

    value = weight*(self.value)
    return value
  end
end
