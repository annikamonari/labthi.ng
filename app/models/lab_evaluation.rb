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
      "Comment" => 0
    }
    down_weight = {
      "Idea" => 10,
      "Question" => 3,
      "Answer" => 5,
      "Solution"=> 5,
      "Comment" => 1
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
      "Idea" => 10,
      "Question" => 5,
      "Answer" => 10,
      "Solution"=> 10,
      "Comment" => 1
    }
    down_weight = {
      "Idea" => 10,
      "Question" => 3,
      "Answer" => 5,
      "Solution"=> 5,
      "Comment" => 1
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
end
